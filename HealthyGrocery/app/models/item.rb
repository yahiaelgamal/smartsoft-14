class Item
  include Mongoid::Document
  	field :price , type: Float  
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Integer 
	field :status , type: Boolean
	field :category , type: String
  belongs_to_many :orders , class_name: "Order" , inverse_of :items
  belongs_to_many :packages , class_name: "Package" , inverse_of :items
end
