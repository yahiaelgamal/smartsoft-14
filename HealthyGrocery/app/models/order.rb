class Order
  include Mongoid::Document
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :     include Mongoid::Timestamps::Created
  #function:  indicating the time of creating the order
  include Mongoid::Timestamps::Created
<<<<<<< HEAD
  include Geocoder::Model::Mongoid

  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode 

    field :address ,type: String
=======
>>>>>>> master
  field :orderNo ,type: Integer
  field :price   ,type: Integer
  #has_many :items ,class 'Item'
  field :weight ,type: Integer
  field :volume ,type: Integer
  field :status , type: String
  field :district , type: String
  field :date  ,type: Date
  field :coordinates ,type: Array
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :   isfinished , delivered
  #function: indicating the status of the orde
  field :isfinished,type: Boolean
  field :delivered ,type: Boolean
  belongs_to :member ,class_name: 'Member'
  belongs_to :route , class_name: 'Route' , inverse_of: :orders
  has_many :packages , class_name: 'Package' , inverse_of: :order
  has_many :items , class_name: 'Item' , inverse_of: :order
  #Author: FatmaEmran
  #T2
  #Function: lines of order items.
  has_many :lines , class_name: 'Lineitem', inverse_of: :order
  #This method is responsible of getting the
  #exact order that user searched for using the order number
  def self.search(search)
    if search
      where(orderNo: search)
    else
      scoped
    end
  end
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :   array of orders 
  #function: returns an array of arrays each array contains the order from one district 
  def self.order_district (orders)
    arr_of_orders_district = Array.new
    arr_of_district = Array.new
    for order_1 in orders
      district = order_1.district
      if !(arr_of_district.include? district)
        arr_of_district.push(district)
      end
    end
    for district in arr_of_district
      arr_of_orders = Array.new
      for order in orders
        if order.district === district
          arr_of_orders.push(order)
        end
      end
      arr_of_orders_district.push(arr_of_orders)
    end
    return arr_of_orders_district
  end
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :   array of orders and wanted time 
  #function:  this is just a temp and the full one will be done by omar  
<<<<<<< HEAD
  def get_optimised_orders(orders,timelimit)
addresses = Array.new

orders.each do |order|
addresses << order.address
end

permutations=addresses.permutation.to_a
mindistance=1000000000000
chosen=permutations[0]

permutations.each do |permutation|

time=0
distance=0


for i in 0...permutation.length-1
directions = GoogleDirections.new(addresses[i],addresses[i+1])

time += directions.drive_time_in_minutes

distance += directions.distance_in_miles

break if time>timelimit
break if distance>mindistance
end
chosen = permutation << time if distance < mindistance && time<timelimit
mindistance = distance if distance < mindistance && time<timelimit


end



return chosen
   



end 

end



=======
  def self.get_optimized_orders(orders,time)
    return orders
  end
end
>>>>>>> master
