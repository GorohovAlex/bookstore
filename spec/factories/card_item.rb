FactoryBot.define do
  factory :cart_item do
    user { create(:user) }
    book { create(:book) }
    quantity { rand(1..5) }
  end
end
