class User < ApplicationRecord
  PASSWORD_FORMAT_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,}\z/.freeze

  validates :password,
            format: { with: PASSWORD_FORMAT_REGEX },
            on: :create

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  has_one  :shipping_address, as: :owner, dependent: :destroy
  has_one  :billing_address, as: :owner, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.facebook_data']
      if data && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
