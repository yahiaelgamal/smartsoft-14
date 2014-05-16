# spec/factories/diseases.rb
FactoryGirl.define do
  factory :disease do |f|
    f.name "cancer"
    f.information "common disease"
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