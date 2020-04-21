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

    trait :with_state_confirm do
      aasm_state { :comfirm }
    end

    trait :with_state_complete do
      aasm_state { :complete }
    end

    # trait :with_addresses do
    # end

    # trait :with_delivery do
    # delivery { create :delivery }
    # end

    # trait :with_payment do
    # payment {  }
    # end
  end
end
