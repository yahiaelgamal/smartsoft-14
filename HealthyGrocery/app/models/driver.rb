class Driver
  include Mongoid::Document
  #include Mongoid::Paperclip
  field :name, type: String
  field :phone, type: Integer
  field :address, type: String
  field :date ,type: Date

  validates :name, presence: true
  validates :phone, presence: true, numericality: true
  validates :address, presence: true
  # Author: Hazem Amin
  # Component: 5 
  #Added some validations in order not to get bad data
end
  #Author: Hazem Amin
  #Component: 5
  #Creating the driver with the attributes defined in story 5.7