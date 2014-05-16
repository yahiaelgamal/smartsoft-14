# spec/models/disease.rb
require 'spec_helper'

describe Disease do
  it "has a valid factory" do
  	Disease.all.destroy
    FactoryGirl.create(:disease).should be_valid 
  end
  it "is invalid without a name" do
  	Disease.all.destroy
    FactoryGirl.build(:disease, name: nil).should_not be_valid
  end	
  describe "prevent same item to be in both recommended and restricted items per disease" do
  	before :each do
  	Disease.all.destroy	
    @disease = FactoryGirl.create(:disease)
    @item = FactoryGirl.create(:item)
    @recommended_array = []
    @restricted_array = []
    @emty = []
    @recommended_array << @item.id
    @restricted_array << @item.id
  	end	
    context "no conflict" do
      it "returns true as no item is picked in both recommended and restricted items" do	 
        Disease.check_items(@disease,@recommended_array,@emty).should == true    
      end
    end  
    context "conflict exits" do	 
      it "returns false as same item is picked in both recommended and restricted items" do	
        Disease.check_items(@disease,@recommended_array,@restricted_array).should == false  
      end
    end
  end  	
end





	