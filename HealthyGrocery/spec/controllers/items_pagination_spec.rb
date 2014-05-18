describe "pagination" do
  Item.all.destroy
  it "should paginate the feed" do
     6.times { FactoryGirl.create(:item) }
     visit items_path
     page.should have_selector('div.pagination')
  end
end
