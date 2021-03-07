require_relative 'checkout_base_page'
require_relative 'sections/delivery_item_section'

class CheckoutDeliveryPage < CheckoutBasePage
  element  :order_summary,  '.order-summary'
  sections :delivery_items, DeliveryItemSection, '.delivery-items'
end
