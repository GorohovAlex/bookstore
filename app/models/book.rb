class Book < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }
  validates :year_of_publication,
            presence: true,
            numericality: { only_integer: true },
            length: { maximum: YEAR_MAX_LENGTH }

  monetize :price_cents

  has_many :book_authors
  has_many :authors, through: :book_authors, dependent: :destroy

  belongs_to :category
end
