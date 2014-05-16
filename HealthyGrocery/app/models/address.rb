      # Author: Mahmoud Walid
      # Team: 3
      # Function: this model is used to create an address book for 
      # the member through the has_many addresses relation 
class Address
  include Mongoid::Document

# ------------------------------------------------------------------------------------
#   Author: Karim El-Bawab
#   Team: 4
#   Function: Geocode is a gem that used here in this model in 
#   order to transform the string street to its coordinates on 
#   the real map and save it on the array coordinates 
# ------------------------------------------------------------------------------------

  include Geocoder::Model::Mongoid

  geocoded_by :street       
  after_validation :geocode 

  field :name, type: String
  field :first , type: String
  field :firstname, type: String
  field :lastname, type: String
  field :country, type: String
  field :city, type: String
  field :postal, type: Integer
  field :street, type: String

  # Author:Karim El-Bawab
  # Team: 4
  # Function: The array coordinates contains the value of the
  # longitude in position [0] and the value of the latiude in
  # position [1]. it is by default had the coordinates of the 
  # tahrir square in cairo but it is overwriten by the values 
  # that generates by the geocode  
  field :coordinates, :type => Array , :default => [31.235726308822677,30.044366207449162]
    # Author: Mahmoud Walid
    # Team: 3
    # Function: validating presence of the attributes and numericality of the postal code
   validates :name , :presence => true
   validates :firstname , :presence => true
   validates :lastname , :presence => true
   validates :country , :presence => true
   validates :city , :presence => true
   validates :postal , :presence => true , :numericality => true , length: { is: 5 }
   validates :street , :presence => true
   belongs_to :member , class_name: "Member" , inverse_of: :addresses
   has_and_belongs_to_many :order , class_name: "Order" , inverse_of: :address
end
