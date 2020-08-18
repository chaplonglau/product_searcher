require_relative 'service_objects/create_response'
require_relative 'service_objects/process_products'
require_relative 'service_objects/read_console'
require_relative 'service_objects/validate_input'
require_relative 'service_objects/read_file'

require 'pry'

class ProductEngine
  def run
    products = ServiceObjects::ReadFile.new("products.json").call
    store, value_to_attribute_map = ServiceObjects::ProcessProducts.new(products).call
    type, options = ServiceObjects::ReadConsole.new.call
    ServiceObjects::ValidateInput.new(type, options, store, value_to_attribute_map).call
    ServiceObjects::CreateResponse.new(type, options, store, value_to_attribute_map).call
  end   

end 