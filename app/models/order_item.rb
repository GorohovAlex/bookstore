class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book, counter_cache: true
  monetize :price_cents
  monetize :total_cents
end
