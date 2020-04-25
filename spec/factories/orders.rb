FactoryBot.define do
  factory :order do
    use_billing_address { false }
    user

    trait :with_state_address do
      aasm_state { :address }
    end

    trait :with_state_delivery do
      aasm_state { :delivery }
    end

    trait :with_state_payment do
      aasm_state { :payment }
    end

    trait :with_state_confirmation do
      aasm_state { :comfirmation }
    end

    trait :with_state_completed do
      aasm_state { :completed }
    end
  end
end
