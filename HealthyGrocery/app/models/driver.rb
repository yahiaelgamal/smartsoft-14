class Driver
  include Mongoid::Document
  #include Mongoid::Paperclip
  field :name, type: String
  field :phone, type: Integer
  field :address, type: String
end
