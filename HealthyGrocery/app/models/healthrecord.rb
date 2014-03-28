class Healthrecord
  include Mongoid::Document
 # here are the different attributes of class healthrecord
  field :name , type: String
  field :bmi, type: Integer
  field :fats, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :program, type: String
  field :bloodtype, type: String
  
   # checks if bmi is present
    validates :bmi , :presence => true 
   # checks if name is present 
    validates :name, :presence => true
   # checks if fats  is present
    validates :fats, :presence => true
   # checks if height is present
    validates :height, :presence => true
   # checks if weight is present
    validates :weight, :presence => true
   # checks if program is present
    validates :program, :presence => true
    # checks if bloodtype is present
    validates :bloodtype, :presence => true
   
  # declare a relationship between users and records
  belongs_to :user , class_name: 'User' , inverse_of: :records 
  # declare a relationship between diseases and records
  has_many :diseases , class_name: 'Disease' , inverse_of: :records

 
end
