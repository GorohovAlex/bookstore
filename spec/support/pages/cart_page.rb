require_relative 'base_page'
require_relative 'sections/cart_item_line_section'
require_relative 'sections/coupon_section'

class CartPage < BasePage
  set_url '/cart'

  sections :cart_items,          CartItemLineSection, '.cart-line-item'
  section  :coupon,              CouponSection, 'form.coupon'
  element  :summary_sub_total,   '#sub-total'
  element  :summary_coupon,      '#coupon'
  element  :summary_order_total, '#order-total'
  element  :checkout_button,     '#checkout'
end
