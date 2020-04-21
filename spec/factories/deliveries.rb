FactoryBot.define do
  factory :delivery do
    name { FFaker::Company.name }
    days { FFaker::Lorem.words(3).join(' ') }
    price { Random.rand(1000..10_000) }
  end
end
