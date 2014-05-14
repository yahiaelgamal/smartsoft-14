# spec/models/shipment.rb
require 'spec_helper'

describe Shipment do

  describe "testing generate_route method" do
    before :each do
      Shipment.all.destroy
      Route.all.destroy
      Order.all.destroy
      Truck.all.destroy
      FactoryGirl.create(:order, district: "Banha")
      FactoryGirl.create(:order, district: "Banha")
      FactoryGirl.create(:order, district: "cairo")
      FactoryGirl.create(:order, district: "Alex",volume: 240)
      FactoryGirl.create(:order, district: "cairo",volume: 100)
      FactoryGirl.create(:truck, capacity: 240)
      FactoryGirl.create(:truck, capacity: 220)
      FactoryGirl.create(:truck, capacity: 240)
      Shipment.generate_routes
    end
    it "creates a new shipment " do
      Shipment.all.count.should == 1
    end
    it "changes the trucks status" do
      truck1 = Truck.all[0]
      truck2 = Truck.all[1]
      truck3 = Truck.all[2]
      truck1.status.should == false
      truck2.status.should == false
      truck3.status.should == false

    end
    it "creates a new route " do
      Route.all.count.should == 3
    end
    it "changes the order status" do
      order1 = Order.all[0]
      order2 = Order.all[1]
      order3 = Order.all[2]
      order4 = Order.all[3]
      order5 = Order.all[4]
      order1.delivered.should == true
      order2.delivered.should == true
      order3.delivered.should == true
      order4.delivered.should == true
      order5.delivered.should == true
    end
  end
end