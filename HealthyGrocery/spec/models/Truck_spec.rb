
require 'spec_helper'
#Author: Andrew Khouzam
#Team: 1
# Function: Tesing the Truck Model

describe Truck do
it "has a valid factory" 
truck = FactoryGirl.create(:truck)
truck.capacity.should == 100

it "is invalid without a firstname" 
it "is invalid without a lastname" 
it "returns a contact's full name as a string"
  
end