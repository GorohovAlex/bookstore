FactoryBot.define do
  factory :order_item do
    book
    quantity { rand(1..2) }
    price { book.price }
    total { quantity * book.price }
  end
end
