class Address
  include Mongoid::Document
  field :name, type: String
  field :first, type: String
  field :last, type: String
  field :country, type: String
  field :city, type: String
  field :postal, type: Integer
  field :street, type: String

   validates :name , :presence => true
   validates :first , :presence => true
   validates :last , :presence => true
   validates :country , :presence => true
   validates :city , :presence => true
   validates :postal , :presence => true , :numericality => true , length: { is: 5 }
   validates :street , :presence => true
   belongs_to :member , class_name: "Member" , inverse_of: :addresses
end
