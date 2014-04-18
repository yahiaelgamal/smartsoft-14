class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean

  belongs_to :shipment , class_name: 'Shipment'  ,:inverse_of => :truck
  has_many :routes , class_name: 'Route'  , :inverse_of => :truck

end
