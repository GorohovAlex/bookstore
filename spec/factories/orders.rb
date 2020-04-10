FactoryBot.define do
  factory :order do
    use_billing_address { false }
  end
end
