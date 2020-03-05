class PasswordForm < BaseForm
  attr_accessor :password_confirmation, :password, :old_password
  MODEL_CLASS = 'User'.freeze

  attribute :old_password, String
  attribute :password, String
  attribute :password_confirmation, String

  validate :verify_old_password

  validates :old_password, presence: true
  validates :password, :password_confirmation,
            presence: true,
            format: { with: User::PASSWORD_FORMAT_REGEX }

  validates_confirmation_of :password, :password_confirmation

  private

  def persist!
    record.reset_password(password, password_confirmation)
  end

  def verify_old_password
    errors.add(:old_password, :invalid, message: I18n.t('.not_valid')) unless record.valid_password?(old_password)
  end
end
