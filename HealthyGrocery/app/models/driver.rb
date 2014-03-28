class Driver
  include Mongoid::Document

  field :name , type: String
  validates_presence_of :name, :message=> "Must enter the driver`s name!"
  field :phone , type: Integer
  validates_presence_of :phone, :message=> "Must enter the driver`s phone number!"
  validates_length_of :phone, minimum: 11, maximum: 11, :message=> "Mobile number must be of length 11.."
  validates_numericality_of :phone, :message=> "Must enter mobile number in numerical form only!"
  field :address , type: String
  validates_presence_of :address, :message=> "Must enter the driver`s address!"
  
  #has_and_belongs_to_many :trucks , class_name: 'Truck' , inverse_of: :drivers

end
