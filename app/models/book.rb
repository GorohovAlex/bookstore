class Book < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }
  validates :year_of_publication, presence: true, numericality: { only_integer: true }, length: { maximum: 4 }

  monetize :price_cents

  has_many :book_authors
  has_many :authors, through: :book_authors

  belongs_to :category
  has_and_belongs_to_many :materials
end
