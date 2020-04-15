MoneyRails.configure do |config|
  config.locale_backend = :i18n
  config.default_currency = :eur
  config.rounding_mode = BigDecimal::ROUND_HALF_UP
  config.no_cents_if_whole = false
end
