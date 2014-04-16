class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean

  belongs_to :shipment , class_name: 'Shipment'  ,:inverse_of => :truck
  belongs_to :route , class_name: 'Route'  , :inverse_of => :truck

  #Defining a method search in truck that can search for a truck using parameters ranging from driver, to capacity to status.
  #Author Hani Zaatar
	def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['driver LIKE ?', 'OR capacity LIKE?', 'OR status LIKE ?', search_condition, search_condition, search_condition])
 	end
end

