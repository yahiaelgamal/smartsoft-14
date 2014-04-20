class Lineitem
  include Mongoid::Document
  field :item_id, type: Integer
  field :cart_id, type: Integer
  field :quantity, type: Integer, default: 1
  belongs_to :item ,class_name: 'Item'
  belongs_to :cart ,class_name: 'Cart'
end
