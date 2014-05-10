class Item
  include Mongoid::Document
  include Mongoid::Paperclip

  field :price , type: Float 
  field :amount , type: Float
 	field :name , type: String  
 	field :description , type: String  
	field :rating , type: Float 
	field :status , type: Boolean
	field :category , type: String
  field :protein , type: Float 
  field :carbohydrate , type: Float 
  field :calcium , type: Float 
  field :fat , type: Float 
  field :paused , type: Boolean
  # Author: Hazem
  #Component: 5
  # Attribute: paused, to keep track whether each and every item is paused or not (boolean)
  field :fiber , type: Float
  field :vitamin_a , type: Float
  field :vitamin_b , type: Float
  field :vitamin_c , type: Float
  field :vitamin_d , type: Float
  field :vitamin_e , type: Float
  field :vitamin_k , type: Float
  field :folate, type: Float
  field :thiamin, type: Float
  field :riboflavin, type: Float
  field :pantothenic_acid, type: Float
  field :choline, type: Float
  field :niacin, type: Float
  field :betaine, type: Float
  field :calcium, type: Float
  field :copper, type: Float
  field :fluoride, type: Float
  field :iron, type: Float
  field :magnesium, type: Float
  field :manganese, type: Float
  field :phosphorus, type: Float
  field :selenium, type: Float
  field :zinc, type: Float
  field :potassium, type: Float
  field :sodium, type: Float
  field :starch, type: Float
  field :sugar, type: Float
  field :fatty_acids, type: Float
  field :trans_fat, type: Float
  field :saturated_fat, type: Float
  field :monounsaturated, type: Float
  field :polyunsaturated, type: Float
  field :trans_monoenoic, type: Float
  field :trans_polyenoic, type: Float
  field :omega_3, type: Float
  field :cartenoids, type: Float
  field :tocopherol, type: Float
  field :retinol, type: Float
  field :beta_carotene, type: Float
  field :alpha_carotene, type: Float
  field :sucrose, type: Float
  field :glucose, type: Float
  field :fructose, type: Float
  field :maltose, type: Float
  field :calories, type: Float
  field :minerals, type: Float
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

  #validates :protein , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  #validates :carbohydrate , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  #validates :calcium , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  #validates :fat , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }

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

