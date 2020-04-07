class OrderSummary < ApplicationRecord
  belongs_to :order
  monetize :price_cents
end
