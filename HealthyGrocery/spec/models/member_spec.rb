require 'spec_helper'

describe Member do 
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
	end
end