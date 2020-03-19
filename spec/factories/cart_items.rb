FactoryBot.define do
  factory :cart_item do
    book { create(:book) }
    quantity { rand(1..5) }
    user { nil }
  end
end
