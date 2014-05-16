require 'spec_helper'

describe 'items/members_items_index.html.erb' do
  it 'Displays filtered items correctly according to the different params selected by the user' do
	Item.all.destroy
	FactoryGirl.create(:item, name: "Apple", price: 5, category: "Fruit", description: "Good", amount: 5, protein: 100, carbohydrate: 100, calcium: 100, fat: 100, vitamin_a: 200, vitamin_b: 200, vitamin_c: 200, vitamin_d: 200, vitamin_e: 200, vitamin_k: 200, image: "http://fruitsbenefits.com/wp-content/uploads/2011/08/apple_logo_rainbow_fruit.jpg")
  	FactoryGirl.create(:item, name: "Mango", price: 5, category: "Fruit", description: "Good", amount: 5, protein: 100, carbohydrate: 100, calcium: 100, fat: 100, vitamin_a: 200, vitamin_b: 200, vitamin_c: 200, vitamin_d: 200, vitamin_e: 200, vitamin_k: 200, image: "http://fruitsbenefits.com/wp-content/uploads/2011/08/apple_logo_rainbow_fruit.jpg")
  	FactoryGirl.create(:item, name: "Tomato", price: 5, category: "Vegetable", description: "Good", amount: 5, protein: 100, carbohydrate: 100, calcium: 100, fat: 100, vitamin_a: 200, vitamin_b: 200, vitamin_c: 200, vitamin_d: 200, vitamin_e: 200, vitamin_k: 200, image: "http://fruitsbenefits.com/wp-content/uploads/2011/08/apple_logo_rainbow_fruit.jpg")
  	FactoryGirl.create(:item, name: "Milk", price: 5, category: "Drink", description: "Good", amount: 5, protein: 100, carbohydrate: 100, calcium: 100, fat: 100, vitamin_a: 200, vitamin_b: 200, vitamin_c: 200, vitamin_d: 200, vitamin_e: 200, vitamin_k: 200, image: "http://fruitsbenefits.com/wp-content/uploads/2011/08/apple_logo_rainbow_fruit.jpg")
  	FactoryGirl.create(:item, name: "Tomeya", price: 5, category: "Vegetable", description: "Good", amount: 5, protein: 100, carbohydrate: 100, calcium: 100, fat: 100, vitamin_a: 200, vitamin_b: 200, vitamin_c: 200, vitamin_d: 200, vitamin_e: 200, vitamin_k: 200, image: "http://fruitsbenefits.com/wp-content/uploads/2011/08/apple_logo_rainbow_fruit.jpg")
  	params[:name] = "tom"
    @items = Item.all.where name: /^#{params[:name]}/i
    @items.count.should == 2
    params[:category] = "Fruit"
    @items = Item.all.where category: params[:category]
    @items.count.should == 2
    params[:price_from] = 1
    @items = Item.all.where :price.gte => params[:price_from]
    @items.count.should == 5
    end
end
