class User
include Mongoid::Document

#gets the library required to encrypt the password
require 'digest/md5' 
#to call the method before save
  before_save :encrypt_password





field :first_name  ,type: String  
field :last_name  ,type: String
field :name  ,type: String
field :age  ,type: Integer
field :email  ,type: String
field :password  ,type: String
field :password_confirmation ,type: String
field :address  ,type: String
field :id  ,type: Integer
has_many :wishItems ,class_name: 'Item'
has_many :historyItems ,class_name: 'Item'
has_many :orders , class_name: 'Order'
#has_many :recommendation, class 'Recommendation'
has_many :records ,class_name: 'Healthrecord' , inverse_of: :user
has_one :warehouse , class_name: 'Warehouse' , inverse_of: :retailer
has_many :diseases , class_name: 'Disease' , inverse_of: :customers
#to validate the presence of the text boxes

validates :first_name,
:presence => true,
:length => {
	:minimum=> 2,
	:allow_blank => true
}


validates :last_name,
:presence => true,
:length => {
	:minimum=> 2,
	:allow_blank => true
}


validates :password,
:presence => true,
:length => {
	:minimum=> 6,
	:allow_blank => true
},
:confirmation => true

validates :password_confirmation,
:presence => true

validates :email,
:presence => true,
:uniqueness => true
#for encrypting password
def encrypt_password
self.password = Digest::MD5.hexdigest(password)
end




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



