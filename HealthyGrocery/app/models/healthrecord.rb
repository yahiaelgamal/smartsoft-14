class Healthrecord
  include Mongoid::Document

  field :name , type: String
  field :bmi, type: Integer
  field :fats, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :program, type: String
  
  
  
  belongs_to :user , class_name: 'User' , inverse_of: :records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :records

 
end
