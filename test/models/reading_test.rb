require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
   
   def setup
      @reading = Reading.new(equipment_number: "5819", reading_bw: "1342", reading_c1: "0", reading_c2: "0", reading_c3: "0", user_id: "1") 
   end
    
    test "recipe should be valid" do 
       assert @reading.valid? 
    end
    
end