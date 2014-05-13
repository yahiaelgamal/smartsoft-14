class Healthrecord
  include Mongoid::Document
  


  #Author:mina sedra
#team : 2
#model of the healthrecord 
#contains all the needed attributes and relations for the healthrecord  
  field :name, type: String
  field :bmi, type: Float
  field :fats, type: Float
  field :height, type: Float
  field :weight, type: Float
  field :program, type: String
  field :fat_per_day, type: Float
  field :calcium_per_day, type: Float
  field :carbohydrate_per_day, type: Float
  field :protein_per_day, type: Float
  field :protein_till_now, type: Float
  field :carbohydrate_till_now, type: Float
  field :calcium_till_now, type: Float
  field :fat_till_now, type: Float
  field :age , type: Integer
  field :gender , type: String
  field :race , type: String
   
   validates_presence_of :name
   validates_presence_of :age
   # validates_presence_of :fats
   validates_presence_of :height
   validates_presence_of :weight
   validates_presence_of :race

   validates_presence_of :program
   validates_presence_of :gender

  validates_numericality_of :height
  validates_numericality_of :weight
  validates_numericality_of :age
  # validates_numericality_of :fats
  validates :age, length: { maximum: 2 }
  validates :height, length: { maximum: 3 }
  validates :weight, length: { maximum: 3 }
  
  belongs_to :member , class_name: 'Member' , inverse_of: :records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :healthrecords 
  belongs_to :use , class_name: 'Use' , :inverse_of => :healthrecord 
  belongs_to :user , class_name: 'Member' , inverse_of: :records
  belongs_to :ordered_user , class_name: 'Member' , inverse_of: :active_records 
  has_many :diseases , class_name: 'Disease' , inverse_of: :records
end
