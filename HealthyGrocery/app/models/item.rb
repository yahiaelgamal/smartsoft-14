class Item
  include Mongoid::Document
  include Mongoid::Paperclip

  field :price , type: Float 
  field :amount , type: Float
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Integer 
	field :status , type: Boolean
	field :category , type: String

  validates :price , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :name, :presence => true
  validates :category, :presence => true
  validates :description, :presence => true
  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  has_mongoid_attached_file :image 
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true

  has_and_belongs_to_many :packages , class_name: "Package" , inverse_of: :items
  has_and_belongs_to_many :orders , class_name: "Order" , inverse_of: :items

end

