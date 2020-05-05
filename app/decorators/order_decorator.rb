class OrderDecorator < ApplicationDecorator
  delegate_all

  NUMBER_LETTER = 'R'.freeze
  NUMBER_LENGTH = 8
  NUMBER_FILL = '0'.freeze

  def order_number
    NUMBER_LETTER + object.id.to_s.rjust(NUMBER_LENGTH, NUMBER_FILL)
  end

  def order_summary
    object.order_items.sum('price_cents * quantity / 100.0').to_money
  end
end
