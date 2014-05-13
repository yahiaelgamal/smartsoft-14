class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean

#Author: Mennatallah Adel
#Team : 4
#Model : Truck
#This is a field of type Integer...its the triptime for the truck and it's added to every view of the truck

field :tripTime, type: Integer
#Author : Ahmed AbdElsattar
#Team: 4
#attr :      has_many :routes , class_name: 'Route'  , :inverse_of => :truck
#function : changing the relation from on belongs to the routes to  has many  routes  
  has_many :routes , class_name: 'Route'  , :inverse_of => :truck

end
