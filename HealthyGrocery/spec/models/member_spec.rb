# spec/models/member.rb
require 'spec_helper'

describe Member do 
	it "has a valid factory" do 
		FactoryGirl.create(:member).should be_valid 
	end 
	it "is invalid without a first name" do
		FactoryGirl.build(:member, first_name: nil).should_not be_valid
	end
	it "is invalid without a last name" do
		FactoryGirl.build(:member, last_name: nil).should_not be_valid
	end
	it "is invalid without a gender" do
		FactoryGirl.build(:member, gender: nil).should_not be_valid
	end
	it "is invalid without phone number" do
		FactoryGirl.build(:member, phone_num: nil).should_not be_valid
	end
	it "is invalid with non numeric phone" do
		FactoryGirl.build(:member, phone_num: "test").should_not be_valid
	end
	it "is invalid without birth date" do
		FactoryGirl.build(:member, birth_date: nil).should_not be_valid
	end
	it "is invalid with non numeric birth date" do
		FactoryGirl.build(:member, birth_date: "test").should_not be_valid
	end
end