class Warehouse
  include Mongoid::Document
  field :address , type: String
  field :phone , type: Integer

  has_one :retailer , class_name: 'User' , inverse_of: :warehouse
end
