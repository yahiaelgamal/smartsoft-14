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
