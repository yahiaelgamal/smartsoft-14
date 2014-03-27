class Disease < ActiveRecord::Base
	field: name type: String
	field: level type: String
	field: restricted_items_amount type: Hash.new { |hash, key| hash[key] = Items } 
	field: recommended_items type: Array.new
	field: information type: String

	belongs_to_many :customers , class 'Customer' inverse_of: :Disease 


end
