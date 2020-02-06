class Category < ApplicationRecord
  validates :name,
            presence: true,
            format: { with: Constants::REGEX_TITLE },
            length: { maximum: Constants::TITLE_MAX_LENGTH }

  has_many :books, dependent: :nullify
end
