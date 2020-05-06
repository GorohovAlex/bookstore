# rubocop:disable Metrics/BlockLength
class Order < ApplicationRecord
  include AASM

  NOT_FINISH_STATUSES = %w[address delivery payment confirmation completed].freeze
  FINISH_STATUSES = %w[completed in_delivery delivered canceled].freeze
  FINISH_DEFAULT_STATUS = 'completed'.freeze

  belongs_to :user

  has_one  :shipping_address, as: :owner, dependent: :destroy
  has_one  :billing_address, as: :owner, dependent: :destroy
  has_one  :order_delivery, dependent: :destroy
  has_one  :order_card, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :order_summary, dependent: :destroy

  scope :not_finish_orders, ->(user_id) { where(user_id: user_id, aasm_state: NOT_FINISH_STATUSES) }
  scope :finish_orders, ->(user_id) { where(user_id: user_id, aasm_state: FINISH_STATUSES) }

  scope :in_process,  -> { completed }
  scope :in_delivery, -> { in_delivery }
  scope :delivered,   -> { delivered }
  scope :canceled,    -> { canceled }

  aasm do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirmation
    state :completed
    state :in_delivery
    state :delivered
    state :canceled

    event :sending do
      transitions from: :confirmation, to: :address
    end

    event :deliver do
      transitions from: :confirmation, to: :delivery
      transitions from: :address, to: :confirmation, guard: :states_completed?
      transitions from: :address, to: :delivery
    end

    event :pay do
      transitions from: :confirmation, to: :payment
      transitions from: :delivery, to: :confirmation, guard: :card_completed?
      transitions from: :delivery, to: :payment
    end

    event :confirm do
      transitions from: :payment, to: :confirmation
    end

    event :complete do
      transitions from: :confirmation, to: :completed
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
# rubocop:enable Metrics/BlockLength
