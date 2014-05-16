# spec/controllers/member.rb
# Author: Mostafa Adel
# Team: 3
# Test name: member_spec
# Function: This test is used to test the validations
require 'spec_helper'

describe  Member do

  it "has a valid factory" do
    Member.all.destroy
    FactoryGirl.create(:member).should be_valid
  end
  it "is invalid without a name" do
    Member.all.destroy
    FactoryGirl.build(:member, first_name: nil).should_not be_valid
  end

  it "is invalid with name less than 2 chars" do
    Member.all.destroy
    FactoryGirl.build(:member, first_name: "m").should_not be_valid
  end


  it "is invalid without a birth_date" do
    Member.all.destroy
    FactoryGirl.build(:member, birth_date: nil).should_not be_valid
  end


  it "is invalid without a phone no" do
    Member.all.destroy
    FactoryGirl.build(:member, phone_num: nil).should_not be_valid
  end

  it "is invalid with non numerical phone " do
    Member.all.destroy
    FactoryGirl.build(:member, phone_num: "mostafa").should_not be_valid
  end

end