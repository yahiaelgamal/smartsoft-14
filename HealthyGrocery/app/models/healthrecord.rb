class Healthrecord
  include Mongoid::Document

  field :name , type: String
  field :bmi, type: Integer
  field :fats, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :program, type: String
  
  
  
  belongs_to :user , class_name: 'Member' , inverse_of: :records
  belongs_to :ordered_user , class_name: 'Member' , inverse_of: :active_records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :records

 
end
