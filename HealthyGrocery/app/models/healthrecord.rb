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

  validates_presence_of :name
  validates_presence_of :bmi
  validates_presence_of :fats
  validates_presence_of :height
  validates_presence_of :weight
  validates_presence_of :program
  validates_numericality_of :height

  belongs_to :member  , class_name: 'Member' , inverse_of: :healthrecord 
  has_many :diseases , class_name: 'Disease' , inverse_of: :healthrecords

  #Author:mina sedra
#team : 2
#model of the healthrecord 
#contains all the needed attributes and relations for the healthrecord  


end
