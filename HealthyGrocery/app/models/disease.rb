class Disease
  include Mongoid::Document
  field :name ,type: String
  validates_presence_of :name ,:message=> "must be Mentioned"
  validates_uniqueness_of :name, :message=> "must be unique"
  field :information , type: String
  field :protein , type: Integer , default: 0
  field :carbohydrate , type: Integer , default: 0
  field :calcium , type: Integer , default: 0
  field :fat , type: Integer , default: 0
  field :vitamin_a , type: Integer , default: 0
  field :vitamin_b , type: Integer , default: 0
  field :vitamin_c , type: Integer , default: 0
  field :vitamin_d , type: Integer , default: 0
  field :vitamin_e , type: Integer , default: 0
  field :vitamin_k , type: Integer , default: 0
  #Author: Jihan Adel
  #Team: 5
  #linking the diseases to the items
  has_and_belongs_to_many :restricted_items , class_name: 'Item' , inverse_of: :bad_for_diseases
  has_and_belongs_to_many :recommended_items , class_name: 'Item' , inverse_of: :good_for_diseases
  belongs_to :customers , class_name: 'Member' , inverse_of: :diseases
  belongs_to :records , class_name: 'Healthrecord' ,inverse_of: :diseases
  #Author: Jihan Adel
  #Team: 5
  #Method name: check_items
  #Function: makes sure the recommended and restricted items are properly added with consderation 
  #to the following cases:
  # 1- the admin can`t choose the same item in both recommended and restricted items
  # 2- the admin can skip choosing the recommended and restricted items at creation,he can add them later
  #Parameters: 
  #  array checked_recommended - contains the ids of the recommended items "from the checkboxes"
  #  array  checked_restricted - contains the ids of the restricted items "from the checkboxes"
  def self.check_items(disease_id,recommended,restricted)
    @flag = true
    disease =  Disease.where(id: disease_id).first
    if recommended != nil
      recommended.each do |s|
        if (restricted != nil && restricted.include?(s))
          @flag = false
        end
      end
    end
    if @flag
        if (recommended != nil && recommended.count != 0)
          disease.recommended_items << Item.find(recommended.first)
          disease.save
          recommended.each do |item|
            disease.recommended_items << Item.find(item)
            disease.save
          end
        end
        if (restricted != nil && restricted.count != 0)
          disease.restricted_items << Item.find(restricted.first)
          disease.save
          restricted.each do |item2|
            disease.restricted_items << Item.find(item2)
            disease.save
          end
        end
    end
    return @flag 
  end	
end
