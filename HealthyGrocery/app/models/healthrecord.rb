class Healthrecord
  include Mongoid::Document
  field :name, type: Integer
  field :bmi, type: Integer
  field :fats, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :program, type: String
  field :acceptable_fat_per_week, type: Integer
  field :acceptable_calcium_per_week, type: Integer
  field :acceptable_carbohydrate_per_week, type: Integer
  field :acceptable_protein_per_week, type: Integer
  field :protein_till_now, type: Integer
  field :carbohydrate_till_now, type: Integer
  field :calcium_till_now, type: Integer
  field :fat_till_now, type: Integer

  belongs_to :user , class_name: 'User' , inverse_of: :healthrecord 
  has_many :diseases , class_name: 'Disease' , inverse_of: :healthrecords
   belongs_to :use , class_name: 'Use' ,  :inverse_of => :healthrecord
end
