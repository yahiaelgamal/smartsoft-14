class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean
  belongs_to :shipment , class_name: 'Shipment' 
  belongs_to :route , class_name: 'Route' , inverser_of: :trucks
  #has_and_belongs_to_many :drivers , class_name: 'Driver' , inverser_of: :trucks
end
