class BasePage < SitePrism::Page
  element :notice,          '#notice'
  element :cart_count_icon, '.shop-quantity'
end
