#spec/factories/healthrecords.rb
FactoryGirl.define do
  factory :healthrecord do |f|
    
    f.name "mahmoud"
    f.bmi  20
    f.fats 20
    f.height 20
    f.weight 20
    f.program "lose"
    f.acceptable_fat_per_week 100
    f.acceptable_calcium_per_week 100
    f.acceptable_carbohydrate_per_week 100
    f.acceptable_protein_per_week 100
    f.acceptable_vitamin_a_per_week 100
    f.acceptable_vitamin_b_per_week 100
    f.acceptable_vitamin_c_per_week 100
    f.acceptable_vitamin_d_per_week 100
    f.acceptable_vitamin_e_per_week 100
    f.acceptable_vitamin_k_per_week 100
    f.protein_till_now 0 
    f.carbohydrate_till_now 0
    f.calcium_till_now 0
    f.fat_till_now 0
    f.vitamin_a_till_now 0
    f.vitamin_b_till_now 0
    f.vitamin_c_till_now 0
    f.vitamin_d_till_now 0
    f.vitamin_e_till_now 0
    f.vitamin_k_till_now 0
    f.fat_per_day 0
    f.calcium_per_day 0
    f.carbohydrate_per_day 0
    f.protein_per_day 0 
 end
end