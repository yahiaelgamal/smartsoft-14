class User

  include Mongoid::Document
field :name  ,type: String
field :age  ,type: Integer
field :email  ,type: String
field :password  ,type: String
field :address  ,type: String
field :id  ,type: Integer
has_many :wishItems ,class_name: 'Item'
has_many :historyItems ,class_name: 'Item'
has_many :orders , class_name: 'Order'
#has_many :recommendation, class 'Recommendation'
has_many :records ,class_name: 'Healthrecord' , inverse_of: :user
has_one :warehouse , class_name: 'Warehouse' , inverse_of: :retailer
has_many :diseases , class_name: 'Disease' , inverse_of: :customers



  #show the total calories and the average intake
  
def show_calories
  
db = Mongo::Connection.new.db("mydb")
  
mongoose.connect('mongodb://localhost:3000/users')
  
  
@user = User.find(params[:id])

  
  
@age = @user.age
  
@weight = @user.Healthrecord.weight
  
@calories = (@age + @weight) * 2
  
@intake = (@age + @weight) / 2

  
puts "your total calories are : %d" %@calories
  
puts "your average intake is : %d"  %@intake
  
  

end



end



