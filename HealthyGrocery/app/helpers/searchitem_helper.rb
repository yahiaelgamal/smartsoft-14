module SearchitemHelper
	def void searchitem
    @user = User.find(params[:id])
    @product_name = gets.Name
    @result = Array.new
db = Mongo::Connection.new.db("mydb")
mongoose.connect('mongodb://localhost:3000/users');
result = db.Item.find(Item.customerID:@user)
if(@result.include(@product_name))
  puts 'Product Name #@product_name '
  else
  puts ' No Result Found / Item Not Recommended '
   end
   end
end