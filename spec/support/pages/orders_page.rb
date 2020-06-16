require_relative 'sections/order_item_section'

class OrdersPage < BasePage
  set_url '/user/orders'

  sections :orders_items, OrderItemSection, '.order_item'
  element :filter_select, '.general-order-dropdown .dropdown-toggle'
  elements :filter_items, '.general-order-dropdown .dropdown-menu a'
end
