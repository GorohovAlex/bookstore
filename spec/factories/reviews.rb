FactoryBot.define do
  factory :review do
    title { FFaker::Lorem.phrase }
    review { FFaker::Lorem.sentence }
    rating { rand(Review::RATING_INTERVAL) }
    book
    user

    trait :empty do
      title { '' }
      review { '' }
    end
  end
end
