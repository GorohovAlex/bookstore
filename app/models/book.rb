class Book < ApplicationRecord
  validates :name,
            presence: true,
            format: { with: Constants::REGEX_TITLE },
            length: { maximum: Constants::TITLE_MAX_LENGTH }
  validates :price_cents,
            presence: true,
            numericality: { only_integer: true }
  validates :year_of_publication,
            presence: true,
            numericality: { only_integer: true },
            length: { maximum: Constants::YEAR_MAX_LENGTH }
  validates :description,
            length: { maximum: Constants::TEXTBOX_MAX_LENGTH }

  monetize :price_cents

  has_many :book_authors
  has_many :authors, through: :book_authors, dependent: :destroy
  belongs_to :category
end
