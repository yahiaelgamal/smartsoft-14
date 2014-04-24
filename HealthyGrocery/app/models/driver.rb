class Driver
  include Mongoid::Document
  #include Mongoid::Paperclip
  field :name, type: String
  field :phone, type: Integer
  field :address, type: String
end
  # Author: Hazem Amin
  # Component: 5
  # Creating the driver with the attributes defined in story 5.7