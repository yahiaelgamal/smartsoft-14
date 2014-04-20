class Cart
  include Mongoid::Document
  has_many :lineitems ,class_name: 'Lineitem', dependent: :destroy
  belongs_to :member , class_name: 'Member' 
  field :totalcost, type: Integer, default: 0
end
