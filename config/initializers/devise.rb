require 'devise/orm/active_record'

Devise.setup do |config|
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.expire_all_remember_me_on_sign_out = true
  config.mailer_sender = 'gorochov.as@gmail.com'
  config.omniauth :facebook, '789874988166617', '3a1893964add349d0f0a976a2552bca0',
                  callback_url: 'http://localhost:3000/users/auth/facebook/callback',
                  scope: 'email', display: 'page'
  config.password_length = 6..128
  config.reconfirmable = true
  config.remember_for = 2.weeks
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.strip_whitespace_keys = [:email]
end
