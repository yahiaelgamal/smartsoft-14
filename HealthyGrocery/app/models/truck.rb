class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean
  belongs_to :shipment , class_name: 'Shipment' 
  belongs_to :route , class_name: 'Route' , inverser_of: :trucks
end
