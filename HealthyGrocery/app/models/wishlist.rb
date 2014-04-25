#Author: Mohamed Saeed
#Team : 1
#Function: model of the wishlist

class Wishlist
  include Mongoid::Document
  has_many :wishline , class_name: 'Wishline' , dependent: :destroy
  belongs_to :member , class_name: 'Member'
end
