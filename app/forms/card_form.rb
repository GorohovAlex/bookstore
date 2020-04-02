require 'credit_card_validations/string'

class CardForm < BaseForm
  MODEL_CLASS = 'Card'.freeze

  DATE_EXPIRY_REGEX = %r{\A(0[1-9]|10|11|12)/[0-9]{2}\z}.freeze

  attribute :order_id, Integer
  attribute :number, String
  attribute :name, String
  attribute :date_expiry, String
  attribute :cvv, String

  validates :number, presence: true, credit_card_number: true
  validates :name, presence: true
  validates :date_expiry, presence: true, format: { with: DATE_EXPIRY_REGEX }
  validates :cvv, presence: true
  validates :cvv, length: { is: 3 }, unless: :card_american_express?
  validates :cvv, length: { is: 4 }, if: :card_american_express?

  private

  def persist!
    record.assign_attributes(card_params)
    record.save
  end

  def record_params
    { order_id: order_id }
  end

  def card_params
    {
      order_id: order_id,
      number: number,
      name: name,
      date_expiry: date_expiry,
      cvv: cvv
    }
  end

  def card_american_express?
    number.credit_card_brand == :amex
  end
end
