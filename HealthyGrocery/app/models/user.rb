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








# needed for login .. still needs the sign up info added by Lotfy

def self.validate_login(email, password)
	user = User.find_by_email(email)

	if user && user.password == Digest::MD5.hexdigest(password)
		user
	else
		nil
	end
end

end



