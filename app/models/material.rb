class Material < ApplicationRecord
  validates :name, presence: true, format: { with: REGEX_TITLE }, length: { maximum: TITLE_MAX_LENGTH }

  has_many :books, dependent: :nullify
end
