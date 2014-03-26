class Order
  include Mongoid::Document
  field :orderNo, type: Integer
  field :price, type: Integer
  field :weight, type: Integer
  field :volume, type: Integer
  field :status, type: String
  field :date, type: Date

#This method is responsible of getting the 
#exact order that user searched for using the order number
  def self.search(search)
    if search
    where(orderNo: search)	
      else
      scoped
    end
  end
end
