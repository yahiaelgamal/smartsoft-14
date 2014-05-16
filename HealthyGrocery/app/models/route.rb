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


#Author: Sameh Metias
#Team: 4
#Attributes: id: is the id of a route
#Function: This method takes an id of a route and returns a url containing all the required 
#coordinates to print the route
  def get_print_url()
    #route = Route.find(id)
    points = self.arrOfPoints   
    #coordinates of the retailer hardcoded
    url = "http://maps.google.com/maps?f=d&source=s_d&saddr=30.199,31.002" 
    len = points.size
    len.times do |i|
      if i == 0
        url << "&daddr="
      end
      url << arrOfPoints[i]*",".sub( " ", "+" )
      if i != (len - 1) 
        url << "+to:" 
      end
    end
    url << "+to:30.199,31.002&ie=UTF8&z=10&pw=2&hl=en"  
    return url
  end

  def test
    return "sameh"
  end
end
