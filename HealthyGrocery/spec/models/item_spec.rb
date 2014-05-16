# spec/models/item.rb
require 'spec_helper'

describe Item do
 it "tillnow attribute should be updated after adding a new item" do
  Item.all.destroy
  Member.all.destroy
  Healthrecord.all.destroy
  item = FactoryGirl.create(:item)
  healthrecord = FactoryGirl.create(:healthrecord)
  member = FactoryGirl.create(:member)
  member.records.push(healthrecord)
  Item.add(member,item.id,1)
  h = Healthrecord.first
  h.protein_till_now.should == 20 
  h.carbohydrate_till_now.should == 20 
  h.calcium_till_now.should == 20 
  h.fat_till_now.should == 20
  h.vitamin_a_till_now.should == 20 
  h.vitamin_b_till_now.should == 20 
  h.vitamin_c_till_now.should == 20 
  h.vitamin_d_till_now.should == 20 
  h.vitamin_e_till_now.should == 20 
  h.vitamin_k_till_now.should == 20 
 end

 it "tillnow attribute should be updated to its max. acceptable range after adding a new item with quantity 5" do
  Item.all.destroy
  Member.all.destroy
  Healthrecord.all.destroy
  item = FactoryGirl.create(:item)
  healthrecord = FactoryGirl.create(:healthrecord)
  member = FactoryGirl.create(:member)
  member.records.push(healthrecord)
  Item.add(member,item.id,5)
  h = Healthrecord.first
  h.protein_till_now.should == 100 
  h.carbohydrate_till_now.should == 100
  h.calcium_till_now.should == 100
  h.fat_till_now.should == 100
  h.vitamin_a_till_now.should == 100
  h.vitamin_b_till_now.should == 100
  h.vitamin_c_till_now.should == 100
  h.vitamin_d_till_now.should == 100
  h.vitamin_e_till_now.should == 100
  h.vitamin_k_till_now.should == 100
 end

 it "tillnow attribute should not be updated when a violation happens while adding an item" do
  Item.all.destroy
  Member.all.destroy
  Healthrecord.all.destroy
  item = FactoryGirl.create(:item)
  healthrecord = FactoryGirl.create(:healthrecord)
  member = FactoryGirl.create(:member)
  member.records.push(healthrecord)
  Item.add(member,item.id,6)
  h = Healthrecord.first
  h.protein_till_now.should == 0 
  h.carbohydrate_till_now.should == 0
  h.calcium_till_now.should == 0
  h.fat_till_now.should == 0
  h.vitamin_a_till_now.should == 0
  h.vitamin_b_till_now.should == 0
  h.vitamin_c_till_now.should == 0
  h.vitamin_d_till_now.should == 0
  h.vitamin_e_till_now.should == 0
  h.vitamin_k_till_now.should == 0
 end
  
#Author: Sameh Metias
#Team: 3
#Function: TDD test cases for the method getting alternative items when 
#the required item is out of stock


  describe "As a member, when I try to add an item to the shopping-cart
  that is almost out of stock"do
    it "sholud display item1 and item2 in the array" do
      i1 = Item.new :name => item1, :protein =>  
      12, :carbohydrate => 12, :calcium => 12, :fat => 12, :vitamin_a => 12,:vitamin_b => 
      12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 12, :vitamin_k=> 12, :stock => 100

      i2 = Item.new :name => item2, :protein => 12, :carbohydrate => 12, :calcium => 12, :fat => 
      12, :vitamin_a => 12,:vitamin_b => 12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 
      12, :vitamin_k=> 12, :stock => 100

      current_item = Item.new :name => item1, :protein =>  
      12, :carbohydrate => 12, :calcium => 12, :fat => 12, :vitamin_a => 12,:vitamin_b => 
      12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 12, :vitamin_k=> 12, :stock => 1

      current_item.get_alternative_stock.should == [i1,i2]
    end
    it "sholud not display any item in the array" do
      i1 = Item.new :name => item1, :protein =>  
      12, :carbohydrate => 12, :calcium => 12, :fat => 12, :vitamin_a => 12,:vitamin_b => 
      12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 12, :vitamin_k=> 12, :stock => 1

      i2 = Item.new :name => item2, :protein => 12, :carbohydrate => 12, :calcium => 12, :fat => 
      12, :vitamin_a => 12,:vitamin_b => 12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 
      12, :vitamin_k=> 12, :stock => 1

      current_item = Item.new :name => item1, :protein =>  
      12, :carbohydrate => 12, :calcium => 12, :fat => 12, :vitamin_a => 12,:vitamin_b => 
      12,:vitamin_c => 12,:vitamin_d => 12,:vitamin_e: => 12, :vitamin_k=> 12, :stock => 1

      current_item.get_alternative_stock.should == []
    end  
  end
end
