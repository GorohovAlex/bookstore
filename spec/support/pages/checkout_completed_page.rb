require_relative 'checkout_base_page'
require_relative 'sections/cart_item_line_section'

class CheckoutCompletedPage < CheckoutBasePage
  element :order_summary, '.order-summary'
  element :order_info, '.order-info'
  sections :cart_line_items, CartItemLineSection, '.cart-line-item'
end
