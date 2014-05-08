class Item
  include Mongoid::Document
  include Mongoid::Paperclip

  field :price , type: Float 
  field :amount , type: Integer
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Integer 
	field :status , type: Boolean
	field :category , type: String
  field :protein , type: Integer 
  field :carbohydrate , type: Integer 
  field :calcium , type: Integer 
  field :fat , type: Integer 
  field :paused , type: Boolean
  # Author: Hazem
  #Component: 5
  # Attribute: paused, to keep track whether each and every item is paused or not (boolean)
  field :fiber , type: Integer
  field :vitamin_a , type: Integer
  field :vitamin_b , type: Integer
  field :vitamin_c , type: Integer
  field :vitamin_d , type: Integer
  field :vitamin_e , type: Integer
  field :vitamin_k , type: Integer
  field :fiber , type: Integer
  field :folate, type: Integer
  field :thiamin, type: Integer
  field :riboflavin, type: Integer
  field :pantothenic_acid, type: Integer
  field :choline, type: Integer
  field :niacin, type: Integer
  field :betaine, type: Integer
  field :calcium, type: Integer
  field :copper, type: Integer
  field :fluoride, type: Integer
  field :iron, type: Integer
  field :magnesium, type: Integer
  field :manganese, type: Integer
  field :phosphorus, type: Integer
  field :selenium, type: Integer
  field :zinc, type: Integer
  field :potassium, type: Integer
  field :sodium, type: Integer
  field :starch, type: Integer
  field :sugar, type: Integer
  field :fatty_acids, type: Integer
  field :trans_fat, type: Integer
  field :saturated_fat, type: Integer
  field :monounsaturated, type: Integer
  field :polyunsaturated, type: Integer
  field :trans_monoenoic, type: Integer
  field :trans_polyenoic, type: Integer
  field :omega_3, type: Integer
  field :cartenoids, type: Integer
  field :tocopherol, type: Integer
  field :retinol, type: Integer
  field :beta_carotene, type: Integer
  field :alpha_carotene, type: Integer
  field :sucrose, type: Integer
  field :glucose, type: Integer
  field :fructose, type: Integer
  field :maltose, type: Integer
  field :calories, type: Integer
  field :minerals, type: Integer
  #Author: Hazem Amin
  #Component: 5
  #Adding additional attributes for the various items

  # checks if price is a number greater than 0
  validates :price , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  # checks if name is present 
  validates :name, :presence => true
  # checks if category  is present
  validates :category, :presence => true
  # checks if description is present
  validates :description, :presence => true
  # checks if amount is present
  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  # declares an attached file as an attribute
  has_mongoid_attached_file :image 
  # checks the attachment type is image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # checks if image is present
  validates :image, :attachment_presence => true

  validates :protein , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :carbohydrate , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :calcium , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :fat , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }

  # declares a relationship between packages and items
  has_and_belongs_to_many :packages , class_name: "Package" , inverse_of: :items
  # declares a relationship between orders and items
  has_and_belongs_to_many :orders , class_name: "Order" , inverse_of: :items

  
  #Author: Jihan Adel
  #Team: 5
  #linking items to diseases

  belongs_to :good_for_diseases , class_name: 'Disease' , inverse_of: :recommended_items
  belongs_to :bad_for_diseases , class_name: 'Disease' , inverse_of: :restricted_items

  
  #Author: Abdelrahman Sakr
  #Team : 1
  #Declaring a relationship between the two classes Item, and Lineitem.
  has_many :lineitems, class_name: "Lineitem"

end

