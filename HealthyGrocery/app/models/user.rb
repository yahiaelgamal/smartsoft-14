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

field :firstname  ,type: String
field :lastname  ,type: String
field :birthdate  ,type: Date
field :phonenumber  ,type: Integer
field :gender  ,type: String

validates :phonenumber, :length => { :is => 11 }
validates :gender, :inclusion => { :in => %w(male female), :message => "%{value} is not a valid gender" }
end