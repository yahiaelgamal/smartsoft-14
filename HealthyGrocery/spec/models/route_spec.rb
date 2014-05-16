# Author: Karim El-Bawab
# Team: 4
# Test name: route_spec
# Function: This test is used to test the method 
# used in the route model that swap the lat with 
# lng in each point in the route 
require 'spec_helper'
describe Route do
  before :each do
	Route.all.destroy
    FactoryGirl.create(:route, arrOfPoints: [[30.232,31.232],[30.121,31.121],[30.343,31.343]])
  end
  it "returns an array with all each elemnts swapped" do
  	id = Route.last.id
	newArr = Route.show(id)
	newArr.should == [[31.232,30.232],[31.121,30.121],[31.343,30.343]]
	newArr.should_not include [30.232,31.232]
	newArr.should_not include [30.121,31.121]
	newArr.should_not include [30.343,31.343]
  end
  it "should not contain any elemnts of the old ones" do
  	id = Route.last.id
	newArr = Route.show(id)
	newArr.should_not include [30.232,31.232]
	newArr.should_not include [30.121,31.121]
	newArr.should_not include [30.343,31.343]
  end
end	
  