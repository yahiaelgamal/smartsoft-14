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
  # Author: Hazem Amin
  # Team: 5
  # Function: Added new needed attributes for the items-class
  field :protein , type: Float
  field :carbohydrate , type: Float
  field :calcium , type: Float
  field :fat , type: Float
  # Author: Hazem
  # Component: 5
  # Attribute: paused, to keep track whether each and every item is
  # paused or not (boolean)
  field :paused , type: Boolean
  # Author: Hazem Amin
  # Team: 5
  # Function: Added other needed attributes for the items-class
  field :vitamin_a , type: Float
  field :vitamin_b , type: Float
  field :vitamin_c , type: Float
  field :vitamin_d , type: Float
  field :vitamin_e , type: Float
  field :vitamin_k , type: Float
  # Author: Hazem Amin
  # Team: 5
  # Function: Added other needed attributes in order to classify
  # the items
  field :vit_a_type, type: String
  field :vit_b_type, type: String
  field :vit_c_type, type: String
  field :vit_d_type, type: String
  field :vit_e_type, type: String
  field :vit_k_type, type: String
  field :protein_type, type: String
  field :carbohydrate_type, type: String
  field :calcium_type, type: String
  field :fat_type, type: String
  # checks if price is a number greater than 0
  validates :price , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  # checks if name is present
  validates :name, :presence => true
  # checks if category is present
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
  # Author: Hazem Amin
  # Team: 5
  # Function: Added validations to make sure the submitted float-values of the
  # nutritions are positive values and that no text-fields are being
  # submitted with no values (empty)
  validates :vitamin_a, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_a, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_b, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_c, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_d, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_e, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vitamin_k, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  # declares a relationship between packages and items
  has_and_belongs_to_many :packages , class_name: "Package" , inverse_of: :items
  # declares a relationship between orders and items
  has_and_belongs_to_many :orders , class_name: "Order" , inverse_of: :items
  ‪#‎Author‬: Jihan Adel
  ‪#‎Team‬: 5
  ‪#‎linking‬ items to diseases
  belongs_to :good_for_diseases , class_name: 'Disease' , inverse_of: :recommended_items
  belongs_to :bad_for_diseases , class_name: 'Disease' , inverse_of: :restricted_items
  #Author: Abdelrahman Sakr
  #Team : 1
  ‪#‎Declaring‬ a relationship between the two classes Item, and Lineitem.
  has_many :lineitems, class_name: "Lineitem"

  def get_alter (item,healthrecord)
    Item.all.each do |canidate|
      if(canidate.vitamin_a.between(item.vitamin_a-) )
    end
  end
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end
