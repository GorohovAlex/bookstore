require_relative 'checkout_base_page'
require_relative 'sections/confirm_info_box_section'
require_relative 'sections/cart_item_line_section'

class CheckoutConfirmationPage < CheckoutBasePage
  element :order_summary, '.order-summary'
  sections :cart_line_items, CartItemLineSection, '.cart-line-item'
  sections :confirm_info_box, ConfirmInfoBoxSections, '.confirm_info_box > div'
end
