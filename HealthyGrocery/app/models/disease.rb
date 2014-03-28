class Disease
  include Mongoid::Document

 field  :name ,type: String

 field :level ,type: String

 field :information , type: String
 
 has_many :restricted_items , class_name: 'Item'
 has_many :recommended_items , class_name: 'Item'
 belongs_to :customers , class_name: 'User' , inverse_of: :diseases 
 belongs_to :records , class_name: 'Healthrecord' ,inverse_of: :diseases
end
