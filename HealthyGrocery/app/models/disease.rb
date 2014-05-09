class Disease
  include Mongoid::Document

 field :name ,type: String
 validates_presence_of :name ,:message=> "must be Mentioned"
 validates_uniqueness_of :name, :message=> "must be unique"
 field :level ,type: String
 field :information , type: String
 field :fat , type: Integer , default: 0
 field :protein , type: Integer , default: 0
 
 has_many :restricted_items , class_name: 'Item' , inverse_of: :bad_for_diseases
 has_many :recommended_items , class_name: 'Item' , inverse_of: :good_for_diseases
 belongs_to :customers , class_name: 'Member' , inverse_of: :diseases 
 belongs_to :records , class_name: 'Healthrecord' ,inverse_of: :diseases
end
