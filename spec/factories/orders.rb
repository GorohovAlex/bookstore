FactoryBot.define do
  factory :order do
    use_billing_address { false }
    user
    aasm_state { :address }
  end
end
