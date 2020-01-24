class Book < ApplicationRecord
  validates :name,  presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :year_of_publication, presence: true, numericality: { only_integer: true }

  monetize :price_cents

  has_many :book_authors
  has_many :authors, through: :book_authors

  belongs_to :category
end
