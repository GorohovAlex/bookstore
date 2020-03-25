class Order < ApplicationRecord
  include AASM

  aasm do
    state :addresses, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :addresses do
      transitions from: :addresses, to: :delivery
    end
  end
end
