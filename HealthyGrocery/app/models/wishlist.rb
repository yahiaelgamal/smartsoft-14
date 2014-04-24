class Wishlist
  include Mongoid::Document
  has_many :wishline , class_name: 'Wishline' , dependent: :destroy
  belongs_to :member , class_name: 'Member'

end
#Author: mohamed lotfy 
  #team : 1
  #model of the wishlist
