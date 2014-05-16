# Author: Karim El-Bawab
# Team: 4
# Test name: addresses_spec
# Function: This test is used to test both the actions
# index and show of addresse controller
require 'spec_helper' 
describe AddressesController do 
  before do
    Address.all.destroy
    Member.all.destroy
    @member = FactoryGirl.create(:member)
    sign_in @member
    Address.all.destroy
  end
  
  describe "GET #show" do 

    it "assigns the requested address to @address" do	
      
        address = FactoryGirl.create(:address)
        get :show, id: address 
        assigns(:address).should eq(address)	
      
    end  
    it "renders the :show template" do
      Address.all.destroy
      get :show, id: FactoryGirl.create(:address)
      response.should render_template :show   
    end 
  end
end 