class GenerateroutesController < ApplicationController

def index 
end

#Author: Ahmed AbdElsattar
#Team: 4
#Method name: gen 
#Function: generate the routes with it's points after doing calculation on the orders according to first come first out 
#and the volume of the orders to the volume of the trucks , cut off time , and the availability of the trucks   
#Parameters: orders
#Example:  orders volume     useraddress  trnom trucksvolume
#            1     3          {22,33}        1     8  
#            2     7          {23,32}        2     7
#            3     6          {22,33}        3     8
#            4     5          {37,22}
#output:
#   orderno        1,4    
#truck_no_1_route {3,5}
#   orderno        2
#truck_no_2_route {7}
#   orderno        3  
#truck_no_3_route {6}
def gen
  if Truck.where(status: true).count > 0 && Order.where(delivered: false).count > 0
  if Shipment.all.count === 0
     Shipment.create
  end
  if Shipment.last.created_at.day < Time.now.day
    Shipment.create 
  end 
  trucks =Truck.where(status: true).order_by([:capacity, :desc])
 for truck in trucks
      if Order.where(delivered: false).count < 0
       break
      end 
      totalvolume = truck.capacity  
        order = Order.where(delivered: false).where(isfinished: true).order_by([:created_at, :asc])
        sum = 0
      arr_of_sel_orders = Array.new
      arr_of_points = Array.new
        order.each do |order_N|
      if order_N.created_at.hour < Shipment.last.cut_off_time || order_N.created_at.day < Time.now.day
          if sum+order_N.volume > totalvolume      
          elsif sum < totalvolume
             sum += order_N.volume
             arr_of_sel_orders.push(order_N) 
          end
      end
    end
    arr_of_sel_orders.each do |p|
       user = Order.where(id: p.id).first.coordinates
        Order.where(id: p.id).update(delivered: true)
        arr_of_points.push(user)
    end
  
   if  arr_of_points.count > 0
   route = Route.where(arrOfPoints: arr_of_points).create
   arr_of_sel_orders.each do |o|
   Route.where(id: route.id).first.orders.push(o)
  Truck.where(id:  truck.id).update(status: false)
   end 
   truck_N = Truck.where(id: truck.id).first.routes.push(route)
   shipment_last = Shipment.last
   Shipment.where(id: shipment_last.id).first.routes.push(route)
    end 
  end
  end
      redirect_to :action => :index
end

#Author: Ahmed AbdElsattar
#Team: 4
#Method name: shipmentupdate 
#Function: change the cut_off_time of the current shipment 
#Parameters:  cut_off_time integer 

def shipmentupdate
        cut_off_time = params[:newcutofftime].to_i
        last_N = Shipment.last
       if Shipment.last.created_at.day < Time.now.day 
                  Shipment.where(cut_off_time: cut_off_time).create
       elsif Shipment.last.cut_off_time <  cut_off_time
           Shipment.where(id: last_N.id).update(cut_off_time: cut_off_time)
       end  
       redirect_to :action => :index
end

#Author: Mennatallah Aziz
#Team: 4
#Method name: showMap
#Function: it sends the array of Points of each route to the javascript file in order to be accessed and showed on the map 
#Parameters: shipment
def show
    @shipment = Shipment.find(params[:id])
       @routes=@shipment.routes

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routes }
    end
 
end 

