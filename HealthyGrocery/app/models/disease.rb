class Disease
  include Mongoid::Document

 field :name ,type: String

 field :level ,type: String

 field :information , type: String
 
 has_many :restricted_items , class_name: 'Item'
 has_many :recommended_items , class_name: 'Item'
 belongs_to :customers , class_name: 'User' , inverse_of: :diseases 
 belongs_to :records , class_name: 'Healthrecord' ,inverse_of: :diseases

# Author: Ahmed Helali
# Team 2
# simply makes sure that when the reatiler
# creates a new disease its level attribute is present
# and a number Greater than or equal zero
 validates :level , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
 
# Author: Ahmed Helali
# Team 2
# A disease must have a name
  validates :name , :presence => true 

end
