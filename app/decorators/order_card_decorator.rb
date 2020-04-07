class OrderCardDecorator < ApplicationDecorator
  delegate_all

  CARD_NUMBER_VISIBLE_ITEMS = 4
  CARD_NUMBER_HIDDEN_SYMBOLS = '** ** ** '.freeze

  def hidden_number
    CARD_NUMBER_HIDDEN_SYMBOLS + object.number.last(CARD_NUMBER_VISIBLE_ITEMS)
  end
end
