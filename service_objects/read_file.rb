require 'json'
module ServiceObjects
  class ReadFile
    attr_reader :file_name
    def initialize(file_name)
      @file_name=file_name
    end 

    def call
      JSON.parse(File.read(@file_name))
    end 
  end 
end 