FactoryBot.define do
  factory :cart_item do
    book
    quantity { rand(1..5) }
    user { nil }
    session_id { nil }
  end
end
