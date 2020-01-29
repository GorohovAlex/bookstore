FactoryBot.define do
  factory :book do
    authors     { Array.new(rand(1..2)) { create :author } }
    description { Faker::Lorem.paragraph }
    name        { Faker::Book.title }
    price       { Faker::Number.between(from: 20, to: 120) }
    category    { create :category }
    year_of_publication { Faker::Number.between(from: 1981, to: 2019) }
  end
end
