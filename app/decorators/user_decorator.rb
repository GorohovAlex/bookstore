class UserDecorator < ApplicationDecorator
  delegate_all

  CHECKOUT_STATUSES = %w[address delivery payment confirm complete].freeze

  def name_first_letter
    object.name.first
  end

  def not_finish_orders
    object.orders.where(aasm_state: CHECKOUT_STATUSES)
  end
end
