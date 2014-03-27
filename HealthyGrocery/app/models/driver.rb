class Driver
  include Mongoid::Document

  field :name , type: String
  field :phone , type: Integer
  field :address , type: String

  
  #has_and_belongs_to_many :trucks , class_name: 'Truck' , inverse_of: :drivers

end
