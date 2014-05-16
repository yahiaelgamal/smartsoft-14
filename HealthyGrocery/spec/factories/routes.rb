#spec/factories/routes.rb
FactoryGirl.define do
  factory :route do |f|
    f.arrOfPoints [30,31]
  end
  factory :invalid_route, parent: :route do |f| 
    f.arrOfPoints nil 
  end
end