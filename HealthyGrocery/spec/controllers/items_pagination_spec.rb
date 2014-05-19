require 'spec_helper'

describe "views/items/index.html.erb" do
  Item.all.destroy
  it "should paginate the items" do
     FactoryGirl.create(:item , name: "hamada1")
     FactoryGirl.create(:item , name: "hamada2")
     FactoryGirl.create(:item , name: "hamada3")
     FactoryGirl.create(:item , name: "hamada4")
     FactoryGirl.create(:item , name: "hamada5")
     FactoryGirl.create(:item , name: "hamada6")
     visit  items_path
     page.should have_selector('div.pagination')
  end
end
