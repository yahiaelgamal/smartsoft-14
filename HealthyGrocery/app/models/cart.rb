class Cart
  include Mongoid::Document

#Authour: Abdelrahman Sakr
#Team : 1
#Model : Cart
#This is the shopping cart where we will add the items which the user will buy, it has totalcost attribute
#which is the cost of all items in the cart, and it has relations with the two classes Lineitem, and Member.
  has_many :lineitems ,class_name: 'Lineitem', dependent: :destroy
  belongs_to :member , class_name: 'Member' 
  field :totalcost, type: Integer, default: 0
end
