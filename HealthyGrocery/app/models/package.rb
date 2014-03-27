class Package
  include Mongoid::Document

  field :expiry_date ,  type: Date 
  
  
  has_many :items , class_name: 'Item' , inverse_of: :packages
  #has_many :recommendations , class_name: 'Recommendation'  
  belongs_to :order , class_name: 'Order' , inverse_of: :packages

end
