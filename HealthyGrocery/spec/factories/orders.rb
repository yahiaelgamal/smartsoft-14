# spec/factories/orders.rb
FactoryGirl.define do
  factory :order do |f|
    f.orderNo 1
    f.price   120
    f.weight  120
    f.volume  120
    f.status  "delivered"
    f.coordinates [11,11]
    f.delivered false
    f.isfinished true
  end
end