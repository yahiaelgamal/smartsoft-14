class Truck
  include Mongoid::Document
  field :capacity, type: Integer
  field :status, type: Boolean
#Author : Ahmed AbdElsattar
#Team: 4
#attr :      has_many :routes , class_name: 'Route'  , :inverse_of => :truck
#function : changing the relation from on belongs to the routes to  has many  routes  
  has_many :routes , class_name: 'Route'  , :inverse_of => :truck
  belongs_to :driver, inverse_of: :truck
end
