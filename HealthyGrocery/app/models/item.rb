class Item
  include Mongoid::Document
  include Mongoid::Paperclip
  field :price , type: Float
  field :amount , type: Integer
  field :name , type: String
  field :description , type: String
  field :rating , type: Integer
  field :status , type: Boolean
  field :category , type: String
  # Author: Hazem Amin
  # Team: 5
  # Function: Added new needed attributes for the items-class
  field :protein , type: Float
  field :carbohydrate , type: Float
  field :calcium , type: Float
  field :fat , type: Float
  # Author: Hazem
  # Team: 5
  # Attribute: paused, to keep track whether each and every item is
  # paused or not (boolean)
  field :paused , type: Boolean
  # Author: Hazem Amin
  # Team: 5
  # Function: Added other needed attributes for the items-class
  field :vitamin_a , type: Float
  field :vitamin_b , type: Float
  field :vitamin_c , type: Float
  field :vitamin_d , type: Float
  field :vitamin_e , type: Float
  field :vitamin_k , type: Float
  # Author: Hazem Amin
  # Team: 5
  # Function: Added other needed attributes in order to classify
  # the items
  field :vit_a_type, type: String
  field :vit_b_type, type: String
  field :vit_c_type, type: String
  field :vit_d_type, type: String
  field :vit_e_type, type: String
  field :vit_k_type, type: String
  field :protein_type, type: String
  field :carbohydrate_type, type: String
  field :calcium_type, type: String
  field :fat_type, type: String
  # Author: Hazem Amin
  # Team: 5
  #Function: Added validations to the different food supplements
  validates :vitamin_a, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :vitamin_b, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :vitamin_c, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :vitamin_d, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :vitamin_e, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :vitamin_k, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :protein, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :carbohydrate, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :calcium, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  validates :fat, :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  # Author: Mahmoud Eldesouky
  # Team : 5
  # added attributes for more item information
  # checks if price is a number greater than 0
  validates :price , :presence => true , :numericality => { :greater_than_or_equal_to => 0 }
  # checks if name is present
  validates :name, :presence => true
  # checks if category  is present
  validates :category, :presence => true
  # checks if description is present
  validates :description, :presence => true
  # checks if amount is present
  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  # declares an attached file as an attribute
  has_mongoid_attached_file :image
  # checks the attachment type is image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # checks if image is present
  #validates :image, :attachment_presence => true
  validates_uniqueness_of :name
  # Author: Hazem Amin
  # Team : 5
  # makes sure the names of items are unique

  # declares a relationship between packages and items
  has_and_belongs_to_many :packages , class_name: "Package" , inverse_of: :items
  # declares a relationship between orders and items
  has_and_belongs_to_many :orders , class_name: "Order" , inverse_of: :items


  #Author: Jihan Adel
  #Team: 5
  #linking items to diseases

  belongs_to :good_for_diseases , class_name: 'Disease' , inverse_of: :recommended_items
  belongs_to :bad_for_diseases , class_name: 'Disease' , inverse_of: :restricted_items


  #Author: Abdelrahman Sakr
  #Team : 1
  #Declaring a relationship between the two classes Item, and Lineitem.
  has_many :lineitems, class_name: "Lineitem"

  #AUTHOR: Mahmoud Eldesouky
  #Team: 5
  #Method name: add
  #Function: checks that the choosen item with its nutrition does not exceed the acceptable limit of
  #this user nutrients that we keep track of through his healthrecord, We access his healthrecord through current_member.
  #Each time an item within the nutrition limits is choosen his till_now attribute in the healthrecord is
  #updated else if a violation happens the message attribute is set with the approprite message and flashed
  #to the user describing his violations. It returns an array that contains in the flag in index 0 and the message in index 1
  #Parameter: current_member,item_id,amount
  #Return: an array that contains the flag in index 0 and the message in index 1
  def self.add(current_member,item_id,amount)
    result = Array.new
    amount = amount.to_i
    item =  Item.where(id:  item_id).first
    if item.amount > 0
      user = current_member
      healthrecord =  user.records.first
      if  healthrecord.blank?
        @message = "Please fill your health record before ordering"
        @flag = false
        result.push(@flag)
        result.push(@message)
        return result
      end
      @flag = true
      @message = "This request with its quantity exceeds the acceptable range of the following: "
      v_counter = 1
      if healthrecord.acceptable_protein_per_week < ((item.protein * amount ) + healthrecord.protein_till_now)
        @message = @message + "" + v_counter.to_s + ".proteins
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_carbohydrate_per_week < ((item.carbohydrate * amount) + healthrecord.carbohydrate_till_now)
        @message = @message + v_counter.to_s+".carbohydrates
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_calcium_per_week < ((item.calcium * amount) + healthrecord.calcium_till_now)
        @message = @message + v_counter.to_s + ".calcium
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_fat_per_week < ((item.fat * amount) + healthrecord.fat_till_now)
        @message = @message + v_counter.to_s + ".fats
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_a_per_week < ((item.vitamin_a * amount) + healthrecord.vitamin_a_till_now)
        @message = @message + v_counter.to_s + ".vitamin A
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_b_per_week < ((item.vitamin_b * amount) + healthrecord.vitamin_b_till_now)
        @message = @message + v_counter.to_s + ".vitamin B
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_c_per_week < ((item.vitamin_c * amount) + healthrecord.vitamin_c_till_now)
        @message = @message + v_counter.to_s + ".vitamin C
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_d_per_week < ((item.vitamin_d * amount) + healthrecord.vitamin_d_till_now)
        @message = @message + v_counter.to_s + ".vitamin D
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_e_per_week < ((item.vitamin_e * amount) + healthrecord.vitamin_e_till_now)
        @message = @message + v_counter.to_s + ".vitamin E
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if healthrecord.acceptable_vitamin_k_per_week < ((item.vitamin_k * amount) + healthrecord.vitamin_k_till_now)
        @message = @message + v_counter.to_s + ".vitamin K
        "

        v_counter = v_counter + 1
        @flag = false
      end
      if (amount === 0)
        @flag = false
        @message = "please enter the quantity"
      end

      if @flag
        protein = healthrecord.protein_till_now + (item.protein * amount )
        carbohydrate = healthrecord.carbohydrate_till_now + (item.carbohydrate * amount)
        calcium = healthrecord.calcium_till_now + (item.calcium * amount)
        fat = healthrecord.fat_till_now + (item.fat * amount)
        vitamin_a = healthrecord.vitamin_a_till_now + (item.vitamin_a * amount)
        vitamin_b = healthrecord.vitamin_b_till_now + (item.vitamin_b * amount)
        vitamin_c = healthrecord.vitamin_c_till_now + (item.vitamin_c * amount)
        vitamin_d = healthrecord.vitamin_d_till_now + (item.vitamin_d * amount)
        vitamin_e = healthrecord.vitamin_e_till_now + (item.vitamin_e * amount)
        vitamin_k = healthrecord.vitamin_k_till_now + (item.vitamin_k * amount)
        Member.where(id: user.id).first.records.update(protein_till_now: protein)
        Member.where(id: user.id).first.records.update(carbohydrate_till_now: carbohydrate)
        Member.where(id: user.id).first.records.update(calcium_till_now: calcium)
        Member.where(id: user.id).first.records.update(fat_till_now: fat)
        Member.where(id: user.id).first.records.update(vitamin_a_till_now: vitamin_a)
        Member.where(id: user.id).first.records.update(vitamin_b_till_now: vitamin_b)
        Member.where(id: user.id).first.records.update(vitamin_c_till_now: vitamin_c)
        Member.where(id: user.id).first.records.update(vitamin_d_till_now: vitamin_d)
        Member.where(id: user.id).first.records.update(vitamin_e_till_now: vitamin_e)
        Member.where(id: user.id).first.records.update(vitamin_k_till_now: vitamin_k)
      end
    else
      @message = "Sorry! This item is not available in stock"
      result.push(@flag)
      result.push(@message)
      return result
    end
    result.push(@flag)
    result.push(@message)
    return result
  end
  #Author: Hazem Amin
  #Team: 5
  #Function: Testing the toggle_pause action
  def self.toggle_pause(item_id)
    @item = Item.find(item_id)

    if @item.amount <= 0 && @item.paused == false
      x = "Can't resume because stock equals #{@item.amount}"
    else
      @item.paused = !@item.paused
      @item.save
      x = "Item toggled successfully"
    end
    return x
  end
end
