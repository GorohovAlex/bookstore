module Users
  class PasswordForm < UserForm
    attr_accessor :password_confirmation, :password, :old_password

    attribute :old_password, String
    attribute :password, String
    attribute :password_confirmation, String

    validates :old_password,
              presence: true

    validate :verify_old_password

    validates :password,
              presence: true,
              format: { with: User::PASSWORD_FORMAT_REGEX }

    validates :password_confirmation,
              presence: true,
              format: { with: User::PASSWORD_FORMAT_REGEX }

    validates_confirmation_of :password, :password_confirmation

    def initialize(attr = {})
      super
    end

    private

    def persist!
      user.reset_password(password, password_confirmation)
    end

    def verify_old_password
      errors.add(:old_password, :invalid, message: I18n.t('.not_valid')) unless user.valid_password?(old_password)
    end
  end
end
