class Shipment
  include Mongoid::Document
  field :cut_off_time, type: Integer
  has_many :trucks , class_name: 'Truck' ,  :inverse_of => :shipment
end
