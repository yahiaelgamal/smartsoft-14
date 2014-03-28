# == Schema Information
#
# Table name: shipments
#
#  id             :integer      not null, primary key
#  cut_off_time          :integer
class Shipment
  include Mongoid::Document
  field :cut_off_time, type: Integer
  has_many :trucks
end
