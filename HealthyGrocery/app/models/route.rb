# == Schema Information
#
# Table name: routes
#
#  id             :integer     not null, primary key
#  arrOfPoints    :Array
class Route
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :arrOfPoints, type: Array
  belongs_to :shipment , counter_cache: true
  has_one :orders , class_name: 'Order' ,  :inverse_of => :route
  belongs_to :truck , class_name: 'Truck' ,  :inverse_of => :route
end
