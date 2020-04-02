FactoryBot.define do
  factory :card do
    number { 'MyString' }
    name { 'MyString' }
    date_expiry { '2020-04-01' }
    cvv { 'MyString' }
  end
end
