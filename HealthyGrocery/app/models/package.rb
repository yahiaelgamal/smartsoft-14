class Package
  include Mongoid::Document

  field :expiry_date  type: DateTimeStap 

 
  has_many :recommendations , class_name: 'Recommendation'  
  belongs_to_one :order , class_name: 'Order' , inverse_of: :package
end
