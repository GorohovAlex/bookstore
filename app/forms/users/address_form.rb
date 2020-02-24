module Users
  class AddressForm < UserForm
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

    attribute :id, Integer
    attribute :first_name, String
    attribute :last_name, String
    attribute :address, String
    attribute :city, String
    attribute :zip, String
    attribute :country, String
    attribute :phone, String

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

    def initialize(params = {})
      params[:id] ? add_parameters(Address.find_by_id(params[:id])) : super
    end

    def add_parameters(params)
      self.first_name = params.first_name
      self.last_name = params.last_name
      self.address = params.address
      self.city = params.city
      self.zip = params.zip
      self.country = params.country
      self.phone = params.phone
    end
  end
end
