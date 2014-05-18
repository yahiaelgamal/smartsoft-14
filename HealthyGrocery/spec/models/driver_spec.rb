require 'spec_helper'

describe Driver do 
	it "has a valid factory" do 
		FactoryGirl.create(:driver).should be_valid 
	end 
	it "is invalid without a name" do
	FactoryGirl.build(:driver, name: nil).should_not be_valid
end
	it "is invalid without an address" do
	FactoryGirl.build(:driver, address: nil).should_not be_valid
end
	it "is invalid without phone " do
	FactoryGirl.build(:driver, phone: nil).should_not be_valid
end
	it "is invalid with non numeric phone" do
	FactoryGirl.build(:driver, phone: "test").should_not be_valid
end

end