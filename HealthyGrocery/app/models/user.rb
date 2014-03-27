class User
  include Mongoid::Document
require 'digest/md5' 
  before_save :encrypt_password


field :first_name  ,type: String  
field :last_name  ,type: String
field :email  ,type: String
field :password  ,type: String
field :password_confirmation ,type: String

field :age  ,type: Integer
field :address  ,type: String
field :id  ,type: Integer
has_many :wishItems ,class_name 'Item'
has_many :historyItems ,class_name 'Item'
has_many :orders , class_name: 'Order'
#has_many :recommendation, class_name 'Recommendation'
has_many :healthRecord ,class_name 'Healthrecord'






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

def encrypt_password
self.password = Digest::MD5.hexdigest(password)
end

end
