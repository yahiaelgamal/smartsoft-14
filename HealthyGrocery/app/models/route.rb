# == Schema Information
#
# Table name: routes
#
#  id             :integer     not null, primary key
#  arrOfPoints    :Array

class Route

  include Mongoid::Document
  field :arrOfPoints, type: Array
  belongs_to :shipment , counter_cache: true
  has_many :orders , class_name: 'Order' , inverse_of: :route
  has_many :trucks , class_name: 'Truck' , inverse_of: :route
end
