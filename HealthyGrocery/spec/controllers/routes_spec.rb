# Author: Karim El-Bawab
# Team: 4
# Test name: routes_spec
# Function: This test is used to test both the actions
# index and show of route controller
require 'spec_helper' 
describe RoutesController do 
  before do
    Route.all.destroy
    Member.all.destroy
    @member = FactoryGirl.create(:member, email: "healthygrocery@gmail.com")
    sign_in @member
    Address.all.destroy
    address = Address.where(:name => "house" ,:first => "Ahmed", :firstname => "Hamada",
     :lastname => "Toto",:country => "Egypt", :city => "Cairo", :postal => 12345,:street => "Makram",
     :coordinates => [31.235726308822677,30.044366207449162]).create
    @member.addresses.push(address)
  end

  describe "GET #index" do 
    it "populates an array of all routes" do
      Route.all.destroy
      route = FactoryGirl.create(:route) 
      get :index 
      assigns(:routes).should eq([route])
    end  
    it "renders the :index view" do
      get :index 
      response.should render_template :index
    end   
  end 

  
  describe "GET #show" do 

    it "assigns the requested route to @route" do	
      
        route = FactoryGirl.create(:route)
        get :show, id: route 
        assigns(:route).should eq(route)	
      
    end  
    it "renders the :show template" do
      Route.all.destroy
      get :show, id: FactoryGirl.create(:route)
      response.should render_template :show   
    end 
  end
end  
