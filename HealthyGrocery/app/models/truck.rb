class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean
  belongs_to :shipment
  belongs_to :route
end
