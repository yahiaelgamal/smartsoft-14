class Member
  include Mongoid::Document
#Author: mohamed lotfy 
#team : 1
#model of the member
#contains all the needed attributes and relations for the member  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
 field :first_name, type: String
 field :last_name, type: String
 field :gender, type: String
 field :address, type: String
 field :phone_num, type: Integer
 field :birth_date, type: Date 
 
   attr_accessible :email, :password, :password_confirmation, :remember_me ,:first_name , :last_name , :gender , :address , :phone_num , :birth_date

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time
 #################

 ##################
  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
#relations  related to the member
  has_one :wishlist ,class_name: 'Wishlist'
has_many :historyItems ,class_name: 'Item'
has_many :orders , class_name: 'Order'
#has_many :recommendation, class 'Recommendation'
has_many :records ,class_name: 'Healthrecord' , inverse_of: :user
has_one :warehouse , class_name: 'Warehouse' , inverse_of: :retailer
has_many :diseases , class_name: 'Disease' , inverse_of: :customers
has_many :recommended_items , class_name: 'Item' , inverse_of: :member

#Author: Abdelrahman Sakr
#Team : 1
#Declaring a new relationship between the User and the Cart.
has_one :cart , class_name: 'Cart'


validates :first_name,
:presence => true,
:length => {
  :minimum=> 2,
  :allow_blank => true
}


validates :last_name,
:presence => true,
:length => {
  :minimum=> 2,
  :allow_blank => true
}

validates :birth_date,
:presence => true


validates :address,
:presence => true



validates :phone_num,
:presence => true

 validates_numericality_of :phone_num
#validates_date :birth_date






  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
