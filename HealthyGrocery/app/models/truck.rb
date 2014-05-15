class Truck
  include Mongoid::Document
  field :capacity, type: Integer
  field :status, type: Boolean
  field :take_off_time, type: DateTime
  field :trip_time_mins, type: Integer
  #Author : Ahmed AbdElsattar
  #Team: 4
  #attr :      has_many :routes , class_name: 'Route'  , :inverse_of => :truck
  #function : changing the relation from on belongs to the routes to  has many  routes
  has_many :routes , class_name: 'Route'  , :inverse_of => :truck
  belongs_to :driver, inverse_of: :truck

  #Author : Ahmed AbdElsattar
  #Team: 4
  #function : changing the status of the Trucks if its returned back the warehouse  according to the trip time 
  #and returns the number of changed trucks
  def self.trucks_condition
    trucks = Truck.where(status: false)
    count = 0
    if trucks.length > 0
      for truck in trucks
        mins_till_now = ((Time.now.strftime('%H').to_i - (truck.take_off_time.strftime('%H').to_i+2))*60)+
          ((Time.now.day - truck.take_off_time.day)*24*60)+(Time.now.min - truck.take_off_time.min)
        if mins_till_now >= truck.trip_time_mins
          Truck.where(id:  truck.id).update(status: true)
          count += 1
        end
      end
    end
    return count
  end
  
end

