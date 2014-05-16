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
      it "assigns a name and information to the new disease" do
      	disease = FactoryGirl.create(:disease)
        get :new
        assigns(:disease).name.should eq("cancer")
        assigns(:disease).information.should eq("common disease")
        assigns(:disease).protein.should eq(20)
        assigns(:disease).carbohydrate.should eq(20)
        assigns(:disease).calcium.should eq(20)
        assigns(:disease).fat.should eq(20)
        assigns(:disease).vitamin_a.should eq(20) 
        assigns(:disease).vitamin_b.should eq(20)
        assigns(:disease).vitamin_c.should eq(20)
        assigns(:disease).vitamin_d.should eq(20)
        assigns(:disease).vitamin_e.should eq(20)
        assigns(:disease).vitamin_k.should eq(20) 
      end
      it "renders the :new template" do
        get :new
        response.should render_template :new
      end   
    end	
    describe "POST #create" do
      context "with valid attributes" do	 
        it "saves the new disease in the database" do
         post :create, :disease => {'name' => 'cancery', 'information'=>'ayklam'}
         assigns(:disease).should be_valid
        end	
        it "redirects to the :index view" do
          post :create, :disease => {'name' => 'cancery', 'information'=>'ayklam'}
          response.should redirect_to(disease_path(assigns[:disease]))
        end	
      end
      context "with invalid attributes" do	 
        it "does not save the new disease in the database" do
          post :create, :disease => {'information'=>'ayklam'}
          flash[:notice].should == 'Name is required.'
          assigns(:disease).should_not be_valid
        end	
        it "re-renders the :new template" do
          response.should render_template :new
        end	
      end
    end	
    describe 'DELETE destroy' do
    	before :each do
    		@disease = FactoryGirl.create(:disease)
    	end
    	it "deletes the disease" do
    	  expect{	
            delete :destroy, id: @disease
    	  }.to change(Disease, :count).by(-1)
    	end	
    	it "redirects to diseases#index" do 
    		delete :destroy, id: @diseases
    		response.should redirect_to (diseases_path)
    	end
    end		
end
