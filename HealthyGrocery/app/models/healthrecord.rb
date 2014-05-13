class Healthrecord
  include Mongoid::Document

  #Author:mina sedra
  #team : 2
  #model of the healthrecord
  #contains all the needed attributes and relations for the healthrecord
  field :name, type: Integer
  field :bmi, type: Integer
  field :fats, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :program, type: String
  field :acceptable_fat_per_week, type: Float
  field :acceptable_calcium_per_week, type: Float
  field :acceptable_carbohydrate_per_week, type: Float
  field :acceptable_protein_per_week, type: Float
  field :protein_till_now, type: Float
  field :carbohydrate_till_now, type: Float
  field :calcium_till_now, type: Float
  field :fat_till_now, type: Float
  field :age , type: Integer
  field :gender , type: String
  field :race , type: String



   validates_presence_of :name
   validates_presence_of :age
   validates_presence_of :height
   validates_presence_of :weight
   validates_presence_of :race

   validates_presence_of :program
   validates_presence_of :gender

  validates_numericality_of :height
  validates_numericality_of :weight
  validates_numericality_of :age
  validates_numericality_of :height  

  belongs_to :member , class_name: 'Member' , inverse_of: :records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :healthrecords 
  belongs_to :use , class_name: 'Use' , :inverse_of => :healthrecord 
  belongs_to :user , class_name: 'Member' , inverse_of: :records
  belongs_to :ordered_user , class_name: 'Member' , inverse_of: :active_records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :records

  field :fat_per_day, type: Float
  field :calcium_per_day, type: Float
  field :carbohydrate_per_day, type: Float
  field :protein_per_day, type: Float
  #Author:Mahmoud Eldesouky
  #team : 5
  #model of the healthrecord
  #needed attributes for the nutrition violations
  field :acceptable_vitamin_a_per_week, type: Float
  field :acceptable_vitamin_b_per_week, type: Float
  field :acceptable_vitamin_c_per_week, type: Float
  field :acceptable_vitamin_d_per_week, type: Float
  field :acceptable_vitamin_e_per_week, type: Float
  field :acceptable_vitamin_k_per_week, type: Float
  field :vitamin_a_till_now, type: Float
  field :vitamin_b_till_now, type: Float
  field :vitamin_c_till_now, type: Float
  field :vitamin_d_till_now, type: Float
  field :vitamin_e_till_now, type: Float
  field :vitamin_k_till_now, type: Float
end
