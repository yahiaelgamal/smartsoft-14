class Warehouse < ActiveRecord::Base
	field :amount 
	field :item

	has_one :retailer , class 'Retailer' inverse_of: :Warehouse
end
