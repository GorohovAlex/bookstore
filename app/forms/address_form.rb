class AddressForm < BaseForm
  MODEL_CLASS = 'Address'.freeze
  DEFAULT_MAX_LENGTH = 50

  ADDRESS_SITY_REGEX = /\A[-',a-zA-Z\d\s]+\z/.freeze

  PHONE_MAX_LENGTH = 15
  PHONE_REGEX = /\A[\d]+\z/.freeze

  ZIP_REGEX = /\A[\d]+[-\d]*[\d]+\z/.freeze
  ZIP_MAX_LENGTH = 10

  attribute :user_id
  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :city, String
  attribute :zip, String
  attribute :country, String
  attribute :phone, String
  attribute :type, String

  validates :first_name, :last_name, :country,
            presence: true,
            format: { with: Constants::REGEX_LETTER_ONLY },
            length: { maximum: DEFAULT_MAX_LENGTH }

  validates :address, :city,
            presence: true,
            format: { with: ADDRESS_SITY_REGEX },
            length: { maximum: DEFAULT_MAX_LENGTH }

  validates :zip,
            presence: true,
            format: { with: ZIP_REGEX },
            length: { maximum: ZIP_MAX_LENGTH }

  validates :phone,
            presence: true,
            format: { with: PHONE_REGEX },
            length: { maximum: PHONE_MAX_LENGTH }

  def initialize(attr = {})
    attr.empty? ? super(address_params) : super(attr)
  end

  private

  def record
    self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(user_id: user_id,
                                                                       type: type || self.class::MODEL_CLASS)
  end

  def persist!
    user_address = record
    user_address.assign_attributes(params)
    user_address.save
  end

  def params
    {
      user_id: user_id,
      first_name: first_name,
      last_name: last_name,
      address: address,
      city: city,
      zip: zip,
      country: country,
      phone: phone,
      type: type,
    }
  end

  def address_params
    ActionController::Parameters.new(record.attributes).permit(:first_name, :last_name, :address, :zip, :city,
                                                               :country, :phone, :type, :user_id)
  end
end
