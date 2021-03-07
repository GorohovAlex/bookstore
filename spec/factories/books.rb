FactoryBot.define do
  factory :book do
    description { FFaker::Lorem.characters(Book::DESCRIPTION_SHORT_LENGTH * 2) }
    name        { FFaker::Book.title.delete(':') }
    price       { rand(20..120) }
    category
    year_of_publication { rand(1981..2019) }

    trait :with_authors do
      authors { create_list :author, rand(1..2) }
    end

    trait :with_reviews do
      reviews { create_list :review, rand(Review::RATING_INTERVAL) }
    end

    after(:create) do |book|
      book.book_dimension ||= create(:book_dimension, book: book)
    end
  end
end
