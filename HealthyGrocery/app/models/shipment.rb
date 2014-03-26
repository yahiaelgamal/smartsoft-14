class Shipment
  include Mongoid::Document
  field :cut_off_time, type: Integer
  has_many :trucks
end
