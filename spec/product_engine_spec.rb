require_relative '../service_objects/create_response'
require_relative '../service_objects/process_products'
require_relative '../service_objects/read_console'
require_relative '../service_objects/validate_input'
require_relative '../service_objects/read_file'
require_relative '../product_engine'

RSpec.describe ProductEngine do 
  let(:engine) { ProductEngine.new }
  let(:file_name) { "products.json" }

  context 'with input as tshirt' do  
    before do
      ARGV.replace(["tshirt"])
    end 
    it 'should return all attributes and options' do
      expect(engine.run).to eql(
        "gender: male, female\ncolor: red, green, navy, white, black\nsize: small, medium, large, extra-large, 2x-large\n")
    end 
  end 

  context 'with input as tshirt female' do  
    before do
      ARGV.replace(["tshirt", "female"])
    end 
    it 'should return all but gender' do
      expect(engine.run).to eql(
        "color: red, green, navy, white, black\nsize: small, medium, large, extra-large, 2x-large\n")
    end 
  end 

  context 'with input as sticker' do  
    before do
      ARGV.replace(["sticker"])
    end 
    it 'should return all attributes and options' do
      expect(engine.run).to eql(
        "size: x-small, small, medium, large, x-large\nstyle: matte, glossy\n")
    end
  end 

  context 'with input as sticker small' do  
    before do
      ARGV.replace(["sticker", "small"])
    end 
    it 'should return all but size' do
      expect(engine.run).to eql(
        "style: matte, glossy\n")
    end 
  end 

  context 'with valid input, and all types' do
    before do
      ARGV.replace(["sticker", "small", "matte"])
    end 
    it 'should return nothing' do
      expect(engine.run).to eql("")
    end 
  end 

  context 'with valid type and valid options, but a repeat)' do
    before do
      ARGV.replace(["sticker", "matte", "matte"])
    end 
    it 'should work fine' do
      expect(engine.run). to eql("size: x-small, small, medium, large, x-large\n")
    end 
  end

  context 'with input as invalid type' do 
    before do
      ARGV.replace(["plant"])
    end 
    it 'should raise error' do
      expect{engine.run}.to raise_error("Product Type does not exist in record")
    end 
  end 

  context 'with input as invalid option' do 
    before do
      ARGV.replace(["tshirt", "plant"])
    end 
    it 'should raise error' do
      expect{engine.run}.to raise_error("Option does not exist in record")
    end 
  end 

  context 'with valid type, an existing option, but option of another type' do
    before do
      ARGV.replace(["sticker", "male"])
    end 
    it 'should return error' do
      expect{engine.run}.to raise_error("Option does not exist for Product Type")
    end 
  end

  context 'with no input' do
    before do
      ARGV.replace([])
    end 
    it 'should raise error' do
      expect{engine.run}.to raise_error("Please input a valid product")
    end 
  end 
end 