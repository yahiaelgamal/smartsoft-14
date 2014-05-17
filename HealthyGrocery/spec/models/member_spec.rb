require 'spec_helper'

describe Member do 
	it "has a valid factory" do 
		FactoryGirl.create(:member).should be_valid 
	end 
	it "is invalid without a first name" do
		FactoryGirl.build(:member, first_name: nil).should_not be_valid
	end
	it "is invalid without a last name" do
		FactoryGirl.build(:member, last_name: nil).should_not be_valid
	end
	it "is invalid without a gender" do
		FactoryGirl.build(:member, gender: nil).should_not be_valid
	end
	it "is invalid without phone number" do
		FactoryGirl.build(:member, phone_num: nil).should_not be_valid
	end
	it "is invalid with non numeric phone" do
		FactoryGirl.build(:member, phone_num: "test").should_not be_valid
	end
	it "is invalid without birth date" do
		FactoryGirl.build(:member, birth_date: nil).should_not be_valid
	end
	describe "#get_count" do
		it "item count in member history should be zero" do 
    		Item.all.destroy
    		Member.all.destroy
    		item=FactoryGirl.create(:item)
    		member=FactoryGirl.create(:member)
    		count = Member.get_count(item,member) 
    		expect(count).to eq 0
		end
		it "item count in member history should be 3" do 
			Item.all.destroy
    		Member.all.destroy
    		item=FactoryGirl.create(:item)
    		member=FactoryGirl.create(:member)
			order_1 = FactoryGirl.create(:order)
			lineitem = FactoryGirl.create(:lineitem)
			lineitem.item_id = item.id
			lineitem.item = item
			order_1.lines.push(lineitem)
			order_2 = FactoryGirl.create(:order)
			lineitem = FactoryGirl.create(:lineitem)
			lineitem.item_id = item.id
			lineitem.item = item
			order_2.lines.push(lineitem)
			order_3 = FactoryGirl.create(:order)
			lineitem = FactoryGirl.create(:lineitem)
			lineitem.item_id = item.id
			lineitem.item = item
			order_3.lines.push(lineitem)
			member.orders.push(order_1,order_2,order_3)
			expect(Member.get_count(item,member)).to eq 3
		end