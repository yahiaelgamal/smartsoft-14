# Author: Mostafa Adel
# Team: 3
# Function: This test is used to test the actions
# index of member controller

require 'spec_helper'
describe MembersController do

  before do

    Member.all.destroy
    @member = FactoryGirl.create(:member)
    sign_in @member
  end

  describe "GET #index" do

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
end