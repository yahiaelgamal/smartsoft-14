#spec/factories/members.rb
FactoryGirl.define do
  factory :member do |f| 
    f.first_name "mahmoud"
    f.last_name "Eldesouky"
    f.gender "Male"
    f.address "Maadi"
    f.phone_num "01221053548" 
    f.birth_date "12/8/1993"
    f.email "mahmoud@eldesouky.com"
    f.password "wefwefefwd"
  end
end