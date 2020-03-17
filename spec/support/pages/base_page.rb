class BasePage < SitePrism::Page
  element :notice,          '#notice'

  element :cart_count_icon, '.hidden-xs .shop-quantity'
end
