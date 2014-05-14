#spec/factories/items.rb
FactoryGirl.define do
  factory :item do |f|
    f.price 100 
    f.amount 100
    f.name "Apple"
    f.description "Fruit"   
    f.rating 2
    f.status true
    f.category "best"
    f.protein 20
    f.carbohydrate 20 
    f.calcium 20
    f.fat 20
    f.vitamin_a 20 
    f.vitamin_b 20
    f.vitamin_c 20
    f.vitamin_d 20
    f.vitamin_e 20
    f.vitamin_k 20
  end
end