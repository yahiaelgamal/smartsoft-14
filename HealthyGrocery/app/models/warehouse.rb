class Warehouse
  include Mongoid::Document
  field :address , type: String
  field :phone , type: Integer

  has_one :retailer , class_name: 'Member' , inverse_of: :warehouse
end
