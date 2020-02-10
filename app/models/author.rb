class Author < ApplicationRecord
  NAME_MAX_LENGTH = 50

  validates :first_name,
            presence: true,
            format: { with: Constants::REGEX_LETTER_ONLY },
            length: { maximum: NAME_MAX_LENGTH }

  validates :last_name,
            presence: true,
            format: { with: Constants::REGEX_LETTER_ONLY },
            length: { maximum: NAME_MAX_LENGTH }

  has_many :book_authors
  has_many :books, through: :book_authors, dependent: :destroy
end
