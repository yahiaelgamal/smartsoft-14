# spec/controllers/diseases_controller_spec.rb
require 'spec_helper'

describe DiseasesController do
	describe "GET #index" do
      it "populates an array of diseases"
      it "renders the :index view"
    end
    describe "GET #show" do
      it "assigns the requested disease to @disease"
      it "renders the :show template" 
    end	
    describe "GET #new" do
      it "assigns a new disease to @disease"
      it "renders the :new template" 
    end	
    describe "POST #create" do
      context "with valid attributes" do	 
        it "saves the new disease in the database"
        it "redirects to the :index view" 
      end
      context "with invalid attributes" do	 
        it "does not save the new disease in the database"
        it "re-renders the :new template" 
      end
    end	
end
