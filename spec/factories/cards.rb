FactoryBot.define do
  factory :order_card do
    number { '6798823404354258' }
    name { FFaker::Name.name }
    date_expiry { rand(1..12).to_s.rjust(2, '0') + '/' + rand(1..99).to_s.rjust(2, '0') }
    cvv { rand(1..99).to_s.rjust(3, '0') }
  end
end
