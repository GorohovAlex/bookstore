FactoryBot.define do
  factory :address do
    type { '' }
    first_name { 'MyString' }
    last_name { 'MyString' }
    address { 'MyString' }
    city { 'MyString' }
    zip { 'MyString' }
    country { 'MyString' }
    phone { 'MyString' }
  end
end
