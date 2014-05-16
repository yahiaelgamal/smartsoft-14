# Author: Karim El-Bawab
# Team: 4
# Test name: shipments_spec
# Function: This test is used to test both the actions
# index and show of shipment controller
require 'spec_helper' 
describe ShipmentsController do 
  before do
    Shipment.all.destroy
    Member.all.destroy
    @member = FactoryGirl.create(:member)
    sign_in @member
    Address.all.destroy
    address = Address.where(:name => "house" ,:first => "Ahmed", :firstname => "Hamada", 
      :lastname => "Toto",:country => "Egypt", :city => "Cairo", :postal => 12345,:street => "Makram",
      :coordinates => [31.235726308822677,30.044366207449162]).create
    @member.addresses.push(address)
  end
  describe "GET #index" do 
    it "populates an array of all shipments" do
      Shipment.all.destroy
      shipment = FactoryGirl.create(:shipment) 
      get :index 
      assigns(:shipments).should eq([shipment])
    end  
    it "renders the :index view" do
      get :index 
      response.should render_template :index
    end   
  end 
  describe "GET #show" do 

    it "assigns the requested shipment to @shipment" do	
      
      if @member.email = "admin@gmail.com"
        shipment = FactoryGirl.create(:shipment)
        get :show, id: shipment 
        assigns(:shipment).should eq(shipment)	
      end
    end  
    it "renders the :show template" do
      Shipment.all.destroy
      get :show, id: FactoryGirl.create(:shipment)
      response.should render_template :show   
    end 
  end
end  
