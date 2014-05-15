# spec/models/truck.rb
require 'spec_helper'

describe Truck do

#Author: Andrew Khouzam
#Team : 1
#Function: It tests if one Truck has many routes.
  it "has many routes" do
    truck = FactoryGirl.create(:truck)
    route1 = Route.create
    route2 = Route.create
    truck.routes.push(route1)
    truck.routes.push(route2)
    truck.routes.count.should == 2
end

#Author: Andrew Khouzam
#Team : 1
#Function: It tests if one Truck has many routes and each routes contains many orders.
# In this test we added two routes for one truck and each route contains two orders 
# so the total orders must be 4.
it "it has many routes, and each route has many orders" do
    truck = FactoryGirl.create(:truck)

    route1 = Route.create
    route2 = Route.create

    truck.routes.push(route1)
    order1 = Order.create
    order2 = Order.create
    route1.orders.push(order1)
    route1.orders.push(order2)

    truck.routes.push(route2)
    order3 = Order.create
    order4 = Order.create
    route2.orders.push(order3)
    route2.orders.push(order4)

    orderscount = truck.routes[0].orders.count
    orderscount = orderscount + truck.routes[1].orders.count

orderscount.should == 4
end


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