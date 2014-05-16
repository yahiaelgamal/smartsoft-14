require 'spec_helper'

describe 'members/hub.html.erb' do
  it 'Displays  correctly according to the button selected by the user' do
      
  FactoryGirl.create(:Truck, driver: "mohamed", capacity: 5, status: true, trip_time_mins: 7
  FactoryGirl.create(:Driver, name: "7amada", phone: 978978675, address: "Dokki"
  FactoryGirl.create(:Order, orderNo: 98, price: 95, address: "Dokki" ,weight: 89, status: "available",district: "ay7eta",
  	it { should have_select("status", :selected => "truck") }
    params[:name] = "mohamed"
    @trucks = Truck.all.where driver: /^#{params[:name]}/i
    @trucks.count.should == 1

	it { should have_select("status", :selected => "driver") }
    params[:name] = "7amada"
    @drivers=Driver.all.where name: /^#{params[:name]}/i
    @drivers.count.should == 1

    it { should have_select("status", :selected => "order") }
    params[:name] = "98"
    @orders=Order.all.where orderNo: /^#{params[:name]}/i
    @orders.count.should == 1

    end
end