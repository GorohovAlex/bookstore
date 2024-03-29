class Book < ApplicationRecord
  TITLE_MAX_LENGTH = 80
  TEXTBOX_MAX_LENGTH = 500
  YEAR_MAX_LENGTH = 4
  DESCRIPTION_SHORT_LENGTH = 250

  validates :name,
            presence: true,
            format: { with: Constants::REGEX_TITLE },
            length: { maximum: TITLE_MAX_LENGTH }

  validates :price_cents,
            presence: true,
            numericality: { only_integer: true }

  validates :year_of_publication,
            presence: true,
            numericality: { only_integer: true },
            length: { maximum: YEAR_MAX_LENGTH }

  validates :description,
            length: { maximum: TEXTBOX_MAX_LENGTH }

  monetize :price_cents

  has_many :book_authors
  has_many :order_items, dependent: :nullify

  has_many :covers, dependent: :destroy
  accepts_nested_attributes_for :covers, allow_destroy: true

  has_many :authors, through: :book_authors, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_one :book_dimension, dependent: :destroy

  has_one :best_seller, dependent: :destroy

  belongs_to :category, counter_cache: true
  has_and_belongs_to_many :materials
end
