class Order
  include Mongoid::Document
  belongs_to :user class 'User' 
field :orderNo , type:Integer
field :price  , type:Integer
has_many :items class 'Item'
field :weight ,type:Integer
field :volume ,type:Integer
field :status , type:String
field :date , type:Date
belongs_to :user class 'User',inverse_of: :orders
belongs_to :shipment class 'Shipment'
end


