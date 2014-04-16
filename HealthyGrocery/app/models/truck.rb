class Truck
  include Mongoid::Document
  field :driver, type: String
  field :capacity, type: Integer
  field :status, type: Boolean

  belongs_to :shipment , class_name: 'Shipment'  ,:inverse_of => :truck
  belongs_to :route , class_name: 'Route'  , :inverse_of => :truck

  #Implementing a method search that searches through the database of trucks by way of driver, capacity &/or status
  #Author : Hani Zaatar
  def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['driver LIKE ?', 'OR capacity LIKE?', 'OR status LIKE ?', search_condition, search_condition, search_condition])
end

end
