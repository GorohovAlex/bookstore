FactoryBot.define do
  factory :book do
    description { FFaker::Lorem.paragraph }
    name        { FFaker::Book.title }
    price       { FFaker::Random.rand(20..120) }
    category
    year_of_publication { FFaker::Random.rand(1981..2019) }

    trait :two_authors do
      authors { create_list :author, 2 }
    end
  end
end
