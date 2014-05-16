# == Schema Information
#
# Table name: routes
#
#  id             :integer     not null, primary key
#  arrOfPoints    :Array
class Route
  include Mongoid::Document
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :     include Mongoid::Timestamps::Created
  #function:  indicating the time of creating the Route 
  include Mongoid::Timestamps::Created

  field :arrOfPoints, type: Array
  belongs_to :shipment , counter_cache: true
#Author : Ahmed AbdElsattar
#Team: 4
#attr :    has_many :orders , class_name: 'Order' ,  :inverse_of => :route
#function : changing the relation from on one to one to many to one  
  has_many :orders , class_name: 'Order' ,  :inverse_of => :route
  belongs_to :truck , class_name: 'Truck' ,  :inverse_of => :route
 
  # Author : Karim El-Bawab
  # Team: 4
  # Method name: show
  # Parameters: id 
  # Function : This function is used to to swap the latiude and the
  # longitude in order to be able to use them to get the real location
  # on the map  
  def self.show(id)
    route = Route.find(id)
    arr = []
    route.arrOfPoints.each do |points|
      arr1 = [points[1],points[0]]
      arr.push(arr1)
  end  
    return arr
  end 
end
