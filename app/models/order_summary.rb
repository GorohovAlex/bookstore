class OrderSummary < ApplicationRecord
  belongs_to :order
  monetize :value_cents

end
