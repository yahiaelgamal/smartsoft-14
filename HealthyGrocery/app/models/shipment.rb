class Shipment
  include Mongoid::Document
#Author : Ahmed AbdElsattar
#attr :     include Mongoid::Timestamps::Created
#function:  indicating the time of creating the shipment 
  include Mongoid::Timestamps::Created
#Author : Ahmed AbdElsattar
#attr :     cut_off_time
#function:  choosing defualt value to be 4 pm 
  field :cut_off_time, type: Integer, default: -> { 16 }
  has_many :trucks , class_name: 'Truck' ,  :inverse_of => :shipment
end
