class Item
  include Mongoid::Document
  	field :price , type: Float  
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Integer 
	field :status , type: Boolean
	field :category , type: String
  has_many :orders , class_name: "Order" , inverse_of: Item
end
