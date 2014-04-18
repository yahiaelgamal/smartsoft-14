class GenerateroutesController < ApplicationController

def index
end

def gen

  if Time.now.hour > 0

if Shipment.last.created_at.day < Time.now.day
   Shipment.create 
 end 
   
   Truck.where(status: true).each do |truck|
     @max = Truck.where(id: truck.id).max(:capacity)
   
     Truck.where(id:  truck.id).update(status: false)
      @totalvolume = truck.capacity
  
        @order = Order.where(delivered: false).where(is_finished: true)
        @sum = 0

      @arrofselorders = Array.new
      @arrofpoints = Array.new
    
    @order.each do |order|
      if order.created_at.hour < 16 || order.created_at.day < Time.now.day
      if @sum+order.volume > @totalvolume
       break
      end   
   
      if @sum < @totalvolume
         @sum += o.volume
         @arrofselorders.push(o) 
      end
      end
    end

    @arrofselorders.each do |p|
        @user = Order.where(id: p.id).first.member
        Order.where(id: p.id).update(delivered: true)
        @arrofpoints.push(@user.coordinates)
    end      

   @route = Route.where(arrOfPoints: @arrofpoints).create
   @truck = Truck.where(id: truck.id).first.routes.push(@route)
   Shipment.last.trucks.push(@truck)
  end
  end
 
  
      redirect_to :action => :index

  
end
 
end 

