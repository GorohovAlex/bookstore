FactoryBot.define do
  factory :book do
    description { FFaker::Lorem.characters(Book::DESCRIPTION_SHORT_LENGTH * 2) }
    name        { FFaker::Book.title.delete(':') }
    price       { FFaker::Random.rand(20..120) }
    category
    year_of_publication { FFaker::Random.rand(1981..2019) }

    trait :with_authors do
      authors { create_list :author, FFaker::Random.rand(1..2) }
    end

    after(:create) do |book|
      book.book_dimension ||= create(:book_dimension, book: book)
    end
  end
end
