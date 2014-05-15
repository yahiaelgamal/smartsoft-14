class Shipment
  include Mongoid::Document
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :     include Mongoid::Timestamps::Created
  #function:  indicating the time of creating the shipment
  include Mongoid::Timestamps::Created
  has_many :routes , class_name: 'Route' ,  :inverse_of => :shipment
  #Author: Ahmed AbdElsattar
  #Team: 4
  #Method name: generate_routes
  #Function: generate the routes with it's points after doing calculation on the orders according to first come first out
  #and the volume of the orders to the volume of the trucks , each truck trip time , and the availability of the trucks
  #Example:  orders volume     useraddress  trnom trucksvolume
  #            1     3          {22,33}        1     8
  #            2     7          {23,32}        2     7
  #            3     6          {22,33}        3     8
  #            4     5          {37,22}
  #output:
  #   orderno        1,4
  #truck_no_1_route {[22,33],[37,22]}
  #   orderno        2
  #truck_no_2_route {[23,32]}
  #   orderno        3
  #truck_no_3_route {[22,33]}
  def self.generate_routes
    Truck.trucks_condition
    if Truck.where(status: true).count > 0 && Order.where(delivered: false).count > 0
      if Shipment.all.count == 0
        Shipment.create
      elsif Shipment.last.created_at.day < Time.now.day
        Shipment.create
      end
      trucks =Truck.where(status: true)

      for truck in trucks
        trip_time_mins = truck.trip_time_mins
        max_volume = truck.capacity
        sum = 0
        arr_of_sel_orders = Array.new
        arr_of_orders_district = Order.order_district(Order.where(delivered: false).where(isfinished: true).order_by([:created_at, :asc]))
        for district in  arr_of_orders_district
          district.each  do |order_n|
            if sum < max_volume
              sum += order_n.volume
              arr_of_sel_orders.push(order_n)
            end
          end
        end
        arr_of_sel_orders = Order.get_optimized_orders(arr_of_sel_orders,(trip_time_mins-(arr_of_sel_orders.size*10)))
        arr_of_points = Array.new
        arr_of_sel_orders.each do |p|
          order_address = Order.where(id: p.id).first.coordinates
          Order.where(id: p.id).update(delivered: true)
          arr_of_points.push(order_address)
        end

        if  arr_of_points.count > 0
          route = Route.where(arrOfPoints: arr_of_points).create
          arr_of_sel_orders.each do |o|
            Route.where(id: route.id).first.orders.push(o)
            Truck.where(id:  truck.id).update(status: false,take_off_time: Time.now )
          end
          Truck.where(id: truck.id).first.routes.push(route)
          shipment_last = Shipment.last
          Shipment.where(id: shipment_last.id).first.routes.push(route)
        end
      end
    end
  end
end