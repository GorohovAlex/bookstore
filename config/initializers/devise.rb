require 'devise/orm/active_record'

Devise.setup do |config|
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.expire_all_remember_me_on_sign_out = true
  config.mailer_sender = 'gorochov.as@gmail.com'
  config.omniauth :facebook, '328931194668186', '9bfd3ea1f19e15e3e71566232b56234c',
                  callback_url: 'http://localhost:3000/users/auth/facebook/callback',
                  scope: 'email,user_friends,user_birthday,user_location',
                  display: 'popup'
  config.password_length = 6..128
  config.reconfirmable = true
  config.remember_for = 2.weeks
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.strip_whitespace_keys = [:email]
end
