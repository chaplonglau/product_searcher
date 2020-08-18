module ServiceObjects
  class CreateResponse
    attr_reader :type, :options, :store, :value_to_attribute_map
    def initialize(type, options, store, value_to_attribute_map)
      @type = type 
      @options = options
      @store = store
      @value_to_attribute_map = value_to_attribute_map
    end 

    def call
      str = "" 
      remainder_options = store[type].keys
      options.each do |option|
         remainder_options -= [value_to_attribute_map[option]]
      end
      remainder_options.each do |option|
        str += "#{option}: #{store[type][option].join(', ')}\n"
      end   
      str
    end 
  end 
end