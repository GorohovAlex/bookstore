class Order < ApplicationRecord
  include AASM

  belongs_to :user

  has_one  :shipping_address,  as: :owner, dependent: :destroy
  has_one  :billing_address,  as: :owner, dependent: :destroy

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
