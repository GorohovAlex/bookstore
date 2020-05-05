class OrderDelivery < ApplicationRecord
  belongs_to :order
  belongs_to :delivery
end
