FactoryBot.define do
  factory :order_delivery do
    delivery { Delivery.first }
  end
end
