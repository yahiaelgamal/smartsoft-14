class Rating
  include Mongoid::Document

  attr_accessible :value

  belongs_to :item
	belongs_to :member

  field :member_id, type: String
  field :item_id, type: String
  field :value, type: Integer
end
