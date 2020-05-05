FactoryBot.define do
  factory :order do
    use_billing_address { false }
    user

    trait :with_items do
      order_items { build_list :order_item, rand(1..10) }
    end

    trait :with_state_address do
      aasm_state { Order::STATE_ADDRESS }
    end

    trait :with_state_delivery do
      aasm_state { Order::STATE_DELIVERY }
    end

    trait :with_state_payment do
      aasm_state { Order::STATE_PAYMENT }
    end

    trait :with_state_confirmation do
      aasm_state { Order::STATE_CONFIRMATION }
    end

    trait :with_state_completed do
      aasm_state { Order::STATE_COMPLETED }
    end
  end
end
