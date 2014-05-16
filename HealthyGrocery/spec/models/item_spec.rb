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
  it "item count in order history should be zero" do
    Item.all.destroy
    Member.all.destroy
    item=FactoryGirl.create(:item)
    member=FactoryGirl.create(:member)
    count = Member.get_count(item,member) 
    expect(count).to eq 0
  end
end