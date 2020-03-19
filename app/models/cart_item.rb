class CartItem < ApplicationRecord
  has_one :user
  belongs_to :book
end
