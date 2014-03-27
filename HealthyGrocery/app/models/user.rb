class User
  include Mongoid::Document
field :name  ,type: String
field :age  ,type: Integer
field :email  ,type: String
field :password  ,type: String
field :address  ,type: String
field :id  ,type: Integer
#has_many :wishItems ,class 'Item'
#has_many :historyItems ,class 'Item'
has_many :orders , class_name: 'Order'
has_many :item, class_name: 'Item'
#has_many :healthRecord ,class 'HealthRecord'

# SEARCHING FOR A PRODUCT
  def searchitem
    @product_name = product_name
  @user = User.find(params[:id])
@result = Array.new
db = Mongo::Connection.new.db("mydb")
mongoose.connect('mongodb://localhost:3000/users');
result = db.Item.find(Item.customerID:@user)
if(@result.include(@product_name))
  puts 'Product Name #@product_name '
  else
  puts ' No Result Found / Item Not Recommended '
end
respond_to do |searchitem|
      searchitem.html # new.html.erb
      searchitem.json { render json: @product_name }
    end
end
end



