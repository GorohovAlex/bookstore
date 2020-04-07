require 'credit_card_validations/string'

class OrderCardForm < BaseForm
  MODEL_CLASS = 'OrderCard'.freeze
  CVV_COUNT = 3
  CVV_AMEX_COUNT = 4

  DATE_EXPIRY_REGEX = %r{\A(0[1-9]|10|11|12)/[0-9]{2}\z}.freeze
  NAME_REGEX = /\A[a-zA-Z\s]+\z/.freeze
  CVV_REGEX = /\A[0-9]+\z/.freeze

  attribute :order_id, Integer
  attribute :number, String
  attribute :name, String
  attribute :date_expiry, String
  attribute :cvv, String

  validates :number, presence: true, credit_card_number: true
  validates :name, presence: true, format: { with: NAME_REGEX, message: I18n.t('checkouts.payment.name_on_card_error') }
  validates :date_expiry, presence: true, format: { with: DATE_EXPIRY_REGEX,
                                                    message: I18n.t('checkouts.payment.date_expiry_error') }
  validates :cvv, presence: true, format: { with: CVV_REGEX, message: I18n.t('checkouts.payment.cvv_error') }
  validates :cvv, length: { is: CVV_COUNT }, unless: :card_american_express?
  validates :cvv, length: { is: CVV_AMEX_COUNT }, if: :card_american_express?

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
    number.valid_credit_card_brand?(:amex)
  end
end
