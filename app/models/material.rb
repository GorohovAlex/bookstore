class Material < ApplicationRecord
  validates :name, presence: true

  has_many :books
  validates_associated :books
end
