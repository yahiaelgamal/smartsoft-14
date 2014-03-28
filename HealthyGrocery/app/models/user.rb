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


#Additional attributes needed for the user to be able to complete sign-up
field :firstname  ,type: String
field :lastname  ,type: String
field :birthdate  ,type: Date
field :phonenumber  ,type: Integer
field :gender  ,type: String

#Checking/Validating that it is a valid phone number, which needs to be exactly 11 digits
validates :phonenumber, :length => { :is => 11 }

#Checking/Validating that the gender is either "male" or "female" and not anything else
validates :gender, :inclusion => { :in => %w(male female), :message => "%{value} is not a valid gender" }
end
