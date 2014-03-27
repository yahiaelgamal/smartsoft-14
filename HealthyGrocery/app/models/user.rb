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
#has_many :recommendation, class 'Recommendation'
#has_many :healthRecord ,class 'HealthRecord'


end



