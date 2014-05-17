# spec/models/truck.rb
require 'spec_helper'

describe Truck do

  it "has a valid factory"  do
    FactoryGirl.create(:truck).should be_valid
  end
  describe "checking the status of the trucks right now" do
    before :each do
      Truck.all.destroy
    end
    it "change the status of the trucks that arrived to the warehouse to be available" do
      if Time.now.strftime('%H').to_i > 0
        take_off_time = Time.now.change(hour: Time.now.strftime('%H').to_i - 1)
      elsif
        take_off_time = Time.now.change(hour: Time.now.strftime('%H').to_i - 1,day: Time.now.day.to_i - 1)
      end
      FactoryGirl.create(:truck,take_off_time: take_off_time,status: false,trip_time_mins: 55)
      FactoryGirl.create(:truck,take_off_time: take_off_time,status: false,trip_time_mins: 50)
      Truck.trucks_condition.should == 2
      Truck.all[0].status.should == true
      Truck.all[1].status.should == true
    end
    it "The truck status should not be changed" do
      if Time.now.strftime('%H').to_i > 0
        take_off_time = Time.now.change(hour: Time.now.strftime('%H').to_i - 1)
      elsif
        take_off_time = Time.now.change(hour: Time.now.strftime('%H').to_i - 1,day: Time.now.strftime('%d').to_i - 1)
      end
      FactoryGirl.create(:truck,take_off_time: take_off_time,status: false,trip_time_mins: 55)
      FactoryGirl.create(:truck,take_off_time: take_off_time,status: false,trip_time_mins: 121)
      Truck.trucks_condition.should == 1
      Truck.all[0].status.should == true
      Truck.all[1].status.should == false
    end
  end
end