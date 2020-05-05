FactoryBot.define do
  factory :coupon do
    name { FFaker::BaconIpsum.word }
    discount { rand(1..10) }
    count { 1 }

    trait :enable do
      enabled { true }
    end

    trait :disable do
      enabled { false }
    end
  end
end
