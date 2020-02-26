FactoryBot.define do
  factory :address do
    type { '' }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name.gsub(/\W/, '') }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    zip { FFaker::AddressUS.zip_code }
    country { FFaker::Address.country_code }
    phone { FFaker::PhoneNumber.short_phone_number.gsub(/\D/, '') }
    user_id { '' }
  end
end
