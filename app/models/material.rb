class Material < ApplicationRecord
  validates :name,
            presence: true,
            format: { with: Constants::REGEX_TITLE },
            length: { maximum: Constants::TITLE_MAX_LENGTH }

  has_and_belongs_to_many :books
end
