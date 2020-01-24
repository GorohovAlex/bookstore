class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name,  presence: true

  has_many :books, through: :book_authors
end
