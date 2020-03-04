FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name.gsub(/\W/, '') }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    zip { FFaker::AddressUS.zip_code }
    country { FFaker::Address.country_code }
    phone { FFaker::PhoneNumber.short_phone_number.gsub(/\D/, '') }
    user
    trait :billing_type do
      type { 'BillingAddress' }
    end
    trait :shipping_type do
      type { 'BillingAddress' }
    end
  end
end
