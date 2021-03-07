class BasePage < SitePrism::Page
  element :notice,          '#notice'
  element :alert,           '#alert'
  element :cart_count_icon, '.shop-quantity'
end
