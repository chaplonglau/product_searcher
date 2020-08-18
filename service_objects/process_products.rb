module ServiceObjects  
  class ProcessProducts
    attr_accessor :products, :store, :value_to_attribute_map

    def initialize(products)
      @products = products
      @store = {}
      @value_to_attribute_map = {}
    end 

    def call
      products.each do |product|
        type = product["product_type"]
        store[type] = {} if store[type] == nil 
        
        product["options"].each do |attribute,value|
          store[type][attribute] = [value] if store[type][attribute] == nil
          store[type][attribute] << value unless store[type][attribute].include?(value)
          value_to_attribute_map[value] = attribute if value_to_attribute_map[value] == nil
        end  
      end 
      [store,value_to_attribute_map]
     end
  end 
end