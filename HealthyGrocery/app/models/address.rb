class Address
  include Mongoid::Document
  field :name, type: String
  field :first , type: String
  field :firstname, type: String
  field :lastname, type: String
  field :country, type: String
  field :city, type: String
  field :postal, type: Integer
  field :street, type: String


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
