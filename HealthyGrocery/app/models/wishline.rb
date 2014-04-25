#Author: Mohamed Saeed
#Team : 1
#Function: line item that will be added to the wishlist
#Parameters: quantity: no. of the same items purchased, item_id: the identification no. for a certain item, 
#            wishlist_id: the identification no for whishlist fot a certain user

class Wishline
  include Mongoid::Document
  field :quantity, type: Integer
  field :item_id , type: Integer
  field :wishlist_id , type: Integer
  belongs_to :item , class_name: 'Item'
  belongs_to :wishlist , class_name: 'Wishlist'  
end
