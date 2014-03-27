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
  has_many :orders 
  has_many :trucks
end
