FactoryBot.define do
  factory :order_delivery do
    order { '' }
    delivery { '' }
    name { 'MyString' }
    days { 'MyText' }
    price { '' }
  end
end
