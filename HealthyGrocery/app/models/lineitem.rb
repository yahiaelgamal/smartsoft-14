class Lineitem
  include Mongoid::Document

#Authour: Abdelrahman Sakr
#Team : 1
#Model : Lineitem
#This is the object which will be added to the shopping cart, it has item_id, cart_id, and quantity as attributes
#and relations with the two models Item, and Cart.
  field :item_id, type: Integer
  field :cart_id, type: Integer
  field :quantity, type: Float, default: 1
  belongs_to :item ,class_name: 'Item'
  belongs_to :cart ,class_name: 'Cart'
end
