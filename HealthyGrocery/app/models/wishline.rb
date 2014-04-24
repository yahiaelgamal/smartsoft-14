class Wishline
  include Mongoid::Document
  field :quantity, type: Integer
  field :item_id , type: Integer
  field :wishlist_id , type: Integer
  belongs_to :item , class_name: 'Item'
  belongs_to :wishlist , class_name: 'Wishlist'
  
end
#Author: mohamed lotfy 
  #team : 1
  #line item that will be added to the wishlist