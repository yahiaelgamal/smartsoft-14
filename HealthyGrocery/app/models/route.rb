class Route
  include Mongoid::Document
  field :arrOfPoints, type: Array
  belongs_to :shipment , counter_cache: true
  has_many :orders , class_name: 'Order' 
  has_many :trucks , class_name: 'Truck' 
end
