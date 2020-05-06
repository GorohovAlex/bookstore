class Category < ApplicationRecord
  has_many :books, dependent: :nullify
  has_one :best_seller, dependent: :destroy

  validates :name, presence: true
end
