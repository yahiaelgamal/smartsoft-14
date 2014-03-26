class Item
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :category, type: String
  field :status, type: Boolean
  field :description, type: String
  field :rating, type: Integer
  validates :name, presence: true
  validates :price, presence: true , numericality: true , :numericality => { :greater_than => 0 }
  validates :category, presence: true
  validates :status, presence: true
  validates :description, presence: true
  
end
