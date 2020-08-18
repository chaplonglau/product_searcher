module ServiceObjects
  class ValidateInput
    attr_reader :type, :options, :store, :value_to_attribute_map
    def initialize(type, options, store, value_to_attribute_map)
      @type = type 
      @options = options
      @store = store
      @value_to_attribute_map = value_to_attribute_map
    end 

    def call
      raise "Please input a valid product" if @type.nil? || @type == ""
      raise "Product Type does not exist in record" unless store.keys.include?(type)
      options.each do |option|
        raise "Option does not exist in record" if @value_to_attribute_map[option] == nil  
        raise "Option does not exist for Product Type" unless store[type].keys.include?(@value_to_attribute_map[option])
      end 

      true
    end 
  end 
end