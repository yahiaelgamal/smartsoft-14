# spec/models/order.rb
require 'spec_helper'

describe Order do

  #In Order to check Omar Sherif's test type rspec spec/models/order_spec.rb


  #Author: Omar Sherif
  #Team: 4
  #Function: It calls the function in order.rb called "get optimized orders" based on global address
  #checks it on global addresses.

  it "has an optimized order based on the order's global address" do
    o1 = Order.create
    o1.address = "New York"
    o2 = Order.create
    o2.address = "Cairo"
    o3 = Order.create
    o3.address = "Melbourne"
    Order.get_optimized_orders([o2,o3,o1],99999999999999999999999999999999999999).should == [o2,o3,o1,0]
  end


  #Author: Omar Sherif
  #Team: 4
  #Function: checks the optimized order on local addresses
  it "has an optimized order based on the order's local address " do

    o1 = Order.create
    o1.address = "Meret Basha, Cairo Governorate, Egypt"

    o2 = Order.create
    o2.address = "Lazoughly Square"

    o3 = Order.create
    o3.address = "El-Shaikh Rihan"

    Order.get_optimized_orders([o2,o3,o1],5000000).should == [o2,o3,o1,9]
  end

  it "has a valid factory"  do
    FactoryGirl.create(:order).should be_valid
  end
  it "returns an array of arrays reflecting each district" do
    banha = FactoryGirl.create(:order, district: "Banha")
    banha1 = FactoryGirl.create(:order, district: "Banha")
    cairo = FactoryGirl.create(:order, district: "cairo")
    alex = FactoryGirl.create(:order, district: "Alex")
    orders = Array.new
    orders.push(banha)
    orders.push(banha1)
    orders.push(cairo)
    orders.push(alex)
    Order.order_district(orders).should == [[banha,banha1], [cairo],[alex]]
  end
  it "returns empty array if there no orders passed to the method" do
    orders = Array.new
    Order.order_district(orders).should == []
  end
end
