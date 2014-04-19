class Order
  include Mongoid::Document
#Author : Ahmed AbdElsattar
#Team: 4
#attr :     include Mongoid::Timestamps::Created
#function:  indicating the time of creating the order 
  include Mongoid::Timestamps::Created

	field :orderNo ,type: Integer
	field :price   ,type: Integer
	#has_many :items ,class 'Item'
	field :weight ,type: Integer
	field :volume ,type: Integer
	field :status , type: String
	field :date  ,type: Date
#Author : Ahmed AbdElsattar
#Team: 4
#attr :   isfinished , delivered
#function: indicating the status of the orde 
	field :isfinished,type: Boolean
	field :delivered ,type: Boolean
	belongs_to :user ,class_name: 'User'
	belongs_to :use ,class_name: 'Use'

	belongs_to :route , class_name: 'Route' , inverse_of: :orders
	belongs_to :shipment, class_name: 'Shipment'
	has_many :packages , class_name: 'Package' , inverse_of: :order

	has_many :items , class_name: 'Item' , inverse_of: :order

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

