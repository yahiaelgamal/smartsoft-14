class Item
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :category, type: String
  field :status, type: Boolean
  field :description, type: String
  field :rating, type: Integer
  
end
