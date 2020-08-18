require 'json'
module ServiceObjects
  class ReadConsole
    attr_reader :type, :options
    def initialize
      args = ARGV
      @type = args[0]
      @options = args[1..-1]
    end

    def call
      [@type,@options]
    end 
  end 
end