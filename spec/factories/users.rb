FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    trait :with_facebook do
      password { Devise.friendly_token[0, 20] }
      name { FFaker::Name.name }
      image { FFaker::Avatar.image }
    end

    trait :with_cart_items do
      cart_item { create_list :cart_item, rand(1..10) }
    end

    trait :with_orders do
      orders { create_list :order, rand(1..10) }
    end
  end
end
