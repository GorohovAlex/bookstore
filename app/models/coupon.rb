class Coupon < ApplicationRecord
  validates :name, uniqueness: true
end
