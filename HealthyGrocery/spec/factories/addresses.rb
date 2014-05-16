# Author: Karim El-Bawab
# Team: 4
# Factory name: addresses
# Function: This file used in order to create 
# virtual address to use it in testing 
FactoryGirl.define do
  factory :address do |f| 
    f.name "house"
    f.first "Ahmed"
    f.firstname "Hamada"
    f.lastname "Toto"
    f.country "Egypt"
    f.city "Cairo" 
    f.postal 12345
    f.street "Makram"
    f.coordinates [31.235726308822677,30.044366207449162] 
  end
end
