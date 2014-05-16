# spec/factories/trucks.rb
FactoryGirl.define do
  factory :truck do |f|
    f.driver   "hussien"
    f.capacity  500
    f.status    true
    f.take_off_time  "2014-05-12 00:06:38 UTC"
    f.trip_time_mins 120
  end
end