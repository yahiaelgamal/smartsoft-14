class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean
#Author : Ahmed AbdElsattar
#Team: 4
#attr :      has_many :routes , class_name: 'Route'  , :inverse_of => :truck
#function : changing the relation from on belongs to the routes to  has many  routes  
  has_many :routes , class_name: 'Route'  , :inverse_of => :truck

end
