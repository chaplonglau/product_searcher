### Summary
This small applicaton takes in a product type and an optional number of arguments and returns the remaining product option categories with the available options.  

For this exercise, I wanted to demonstrate the power of service objects - ruby objects that are designed to do one action. The service objects are named accordingly to its purpose, and the division of work is split step by step. The engine merely puts everything together. 

### Installation
Plain Ruby  
```require 'awesome_print'``` might be useful   

### Running
In terminal, navigate to the base directory and type ```ruby runner.rb``` followed by any arguments you want.  
Format: 
``` ruby runner.rb {TYPE} {OPTION1 OPTION2 ...} ```  
Sample input:  
```ruby runner.rb sticker small```  
```ruby runner.rb sticker ```  

To run a different seed file, add the JSON to the base directory and edit the first line in product_engine.rb with the name of your file. 

### Running Tests
Type ``` rspec ```  into terminal.