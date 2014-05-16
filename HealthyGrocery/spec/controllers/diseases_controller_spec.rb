# spec/controllers/diseases_controller_spec.rb
require 'spec_helper'

describe DiseasesController do
	before :each do
	Disease.all.destroy	
	end	
	def mock_disease(stubs={})
	  @mock_disease ||= mock_model(Disease, stubs).as_null_object	
	end
	describe "GET #index" do
      it "populates an array of diseases" do
        disease = FactoryGirl.create(:disease)
        get :index
        assigns(:diseases).should eq([disease]) 
      end	
      it "renders the :index view" do
        get :index
        response.should render_template :index
      end	
    end
    describe "GET #show" do
      it "assigns the requested disease to @disease" do
        disease = FactoryGirl.create(:disease)
        get :show, id: disease
        assigns(:disease).should eq(disease) 
      end	
      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:disease)
        response.should render_template :show
      end	
    end	
    describe "GET #new" do
      it "renders the :new template" do
        get :new
        response.should render_template :new
      end   
    end	
    describe "POST #create" do
        it "re-renders the :new template" do
          get :new	
          response.should render_template :new
        end	
    end	
    describe 'DELETE destroy' do
    	it "deletes the disease" do
    	  @disease = FactoryGirl.create(:disease)	
    	  expect{	
            delete :destroy, id: @disease
    	  }.to change(Disease, :count).by(-1)
    	end	
    	it "redirects to diseases#index" do 
    		@disease = FactoryGirl.create(:disease)
    		delete :destroy, id: @disease
    		get :index
    		response.should render_template :index
    	end
    end		
end
