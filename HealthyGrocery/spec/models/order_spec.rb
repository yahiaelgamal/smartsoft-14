# spec/models/order.rb
require 'spec_helper'

describe Order do
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