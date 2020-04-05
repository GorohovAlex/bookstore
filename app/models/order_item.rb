class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book
  monetize :price_cents
end
