# spec/models/member.rb
require 'spec_helper'

describe Member do 
  describe "testing allowed_items method" do
    before :each do
     Member.all.destroy
     Item.all.destroy
     Disease.all.destroy
     @member = FactoryGirl.create(:member)
     @disease = FactoryGirl.create(:disease)
     @item = FactoryGirl.create(:item)
     @item2 = FactoryGirl.create(:item ,name: "Orange")
     @item3 = FactoryGirl.create(:item, name: "Bate5")
     @restricted_array = []
     @restricted_array << @item.id
     @restricted_array << @item2.id
     @allowed = []
     @allowed = Item.all
     @disease.restricted_items = @restricted_array 
     @meber.diseases << @disease
     Member.allowed_items(@member, @allowed)
    end
    it "test number of allowed_items " do
      Member.last.allowed_items.count.should == 1 
    end
    it "test name of allowed_items " do
      Member.last.allowed_items[0].name.should == "Bate5" 
    end
  end
end