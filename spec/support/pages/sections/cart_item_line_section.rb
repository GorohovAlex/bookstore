class CartItemLineSection < SitePrism::Section
  element :image,     '.cart-img-shadow'
  element :name,      '.title > a'
  element :price,     '.cart-item-price'
  section :quantity,  CounterSection, '.counter'
  element :sub_total, '.cart-item-sub-total'
  element :close,     '.close'
end
