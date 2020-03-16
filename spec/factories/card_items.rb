FactoryBot.define do
  factory :cart_item do
    user { nil }
    session_id { '' }
    book { nil }
    quantity { '' }
  end
end
