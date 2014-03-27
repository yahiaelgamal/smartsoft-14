class Item
  include Mongoid::Document
  include Mongoid::Paperclip

  field :price , type: Float 
  field :amount , type: Float
  field :picture , type: String  
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Integer 
	field :status , type: Boolean
	field :category , type: String
  attr_accessible :image
  has_mongoid_attached_file :image 
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true

  has_and_belongs_to_many :packages , class_name: "Package" , inverse_of: :items
  has_and_belongs_to_many :orders , class_name: "Order" , inverse_of: :items

end

