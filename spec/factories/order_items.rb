FactoryBot.define do
  factory :order_item do
    book { create(:book) }
    quantity { rand(1..2) }
    price { book.price }
    total { quantity * book.price }
  end
end
