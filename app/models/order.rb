class Order < ApplicationRecord
  include AASM

  belongs_to :user

  has_one  :shipping_address, as: :owner, dependent: :destroy
  has_one  :billing_address, as: :owner, dependent: :destroy
  has_one  :order_delivery, dependent: :destroy

  aasm do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :address do
      transitions from: :address, to: :delivery
    end
  end
end
