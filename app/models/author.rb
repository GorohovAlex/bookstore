class Author < ApplicationRecord
  NAME_MAX_LENGTH = 255

  validates :first_name, presence: true, length: { maximum: NAME_MAX_LENGTH }
  validates :last_name,  presence: true, length: { maximum: NAME_MAX_LENGTH }

  has_many :book_authors
  has_many :books, through: :book_authors, dependent: :destroy
end
