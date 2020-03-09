FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    trait :with_facebook do
      password { Devise.friendly_token[0, 20] }
      name { FFaker::Name.name }
      image { FFaker::Avatar.image }
    end
  end
end
