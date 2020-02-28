module Users
  class AddressForm < BaseForm
    MODEL_CLASS = 'Address'.freeze

    ADDRESS_MAX_LENGTH = 50
    ADDRESS_REGEX = /\A[-',a-zA-Z\d\s]+\z/.freeze

    CITY_MAX_LENGTH = 50
    CITY_REGEX = /\A[-',a-zA-Z\d\s]+\z/.freeze

    COUNTRY_MAX_LENGTH = 50
    NAME_MAX_LENGTH = 50

    PHONE_MAX_LENGTH = 15
    PHONE_REGEX = /\A[\d]+\z/.freeze

    ZIP_REGEX = /\A[\d]+[-\d]*[\d]+\z/.freeze
    ZIP_MAX_LENGTH = 10

    attribute :first_name, String
    attribute :last_name, String
    attribute :address, String
    attribute :city, String
    attribute :zip, String
    attribute :country, String
    attribute :phone, String
    attribute :type, String

    validates :first_name,
              presence: true,
              format: { with: Constants::REGEX_LETTER_ONLY },
              length: { maximum: NAME_MAX_LENGTH }

    validates :last_name,
              presence: true,
              format: { with: Constants::REGEX_LETTER_ONLY },
              length: { maximum: NAME_MAX_LENGTH }

    validates :address,
              presence: true,
              format: { with: ADDRESS_REGEX },
              length: { maximum: ADDRESS_MAX_LENGTH }

    validates :city,
              presence: true,
              format: { with: CITY_REGEX },
              length: { maximum: CITY_MAX_LENGTH }

    validates :zip,
              presence: true,
              format: { with: ZIP_REGEX },
              length: { maximum: ZIP_MAX_LENGTH }

    validates :country,
              presence: true,
              format: { with: Constants::REGEX_LETTER_ONLY },
              length: { maximum: COUNTRY_MAX_LENGTH }

    validates :phone,
              presence: true,
              format: { with: PHONE_REGEX },
              length: { maximum: PHONE_MAX_LENGTH }

    def initialize(params: {}, user: nil)
      @user_id = user.id
      params.empty? ? super(address_params) : super(params)
    end

    private

    def record
      self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(user_id: @user_id, type: type || self.class::MODEL_CLASS)
    end

    def persist!
      user_address = record
      user_address.first_name = first_name
      user_address.last_name = last_name
      user_address.address = address
      user_address.city = city
      user_address.zip = zip
      user_address.country = country
      user_address.phone = phone
      user_address.type = type
      user_address.save
    end

    def address_params
      ActionController::Parameters.new(record.attributes).permit(:first_name, :last_name, :address, :zip, :city, :country, :phone, :type)
    end
  end
end
