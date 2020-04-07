class Order < ApplicationRecord
  include AASM

  belongs_to :user

  has_one  :shipping_address, as: :owner, dependent: :destroy
  has_one  :billing_address, as: :owner, dependent: :destroy
  has_one  :order_delivery, dependent: :destroy
  has_one  :order_card, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :order_summary, dependent: :destroy

  aasm do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :to_address do
      transitions from: :confirm, to: :address
    end

    event :to_delivery do
      transitions from: :confirm, to: :delivery
      transitions from: :address, to: :confirm, guard: :states_completed?
      transitions from: :address, to: :delivery
    end

    event :to_payment do
      transitions from: :confirm, to: :payment
      transitions from: :delivery, to: :confirm, guard: :card_completed?
      transitions from: :delivery, to: :payment
    end

    event :to_confirm do
      transitions from: :payment, to: :confirm
    end

    event :to_complete do
      transitions from: :confirm, to: :complete
    end
  end

  def states_completed?
    delivery_completed? && card_completed?
  end

  def delivery_completed?
    order_delivery.present?
  end

  def card_completed?
    order_card.present?
  end
end
