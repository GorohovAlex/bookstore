require_relative 'checkout_base_page'
require_relative 'sections/confirm_info_box_section'
require_relative 'sections/cart_item_line_section'

class OrderPage < BasePage
  set_url '/user/orders{/id}'

  element :order_summary, '.order-summary'
  sections :info_box, ConfirmInfoBoxSections, '.info_box > div'
  sections :orders_items, CartItemLineSection, '.cart-line-item'
end
