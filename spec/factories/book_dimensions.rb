FactoryBot.define do
  factory :book_dimension do
    book { nil }
    height { 1.5 }
    width { 1.5 }
    depth { 1.5 }
  end
end
