class Category < ApplicationRecord
  has_many :books, dependent: :nullify
  has_many :best_sellers, through: :books

  validates :name, presence: true
end
