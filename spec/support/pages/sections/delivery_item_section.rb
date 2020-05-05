class DeliveryItemSection < SitePrism::Section
  element :name,  '.delivery-name'
  element :days,  '.delivery-days'
  element :price, '.delivery-price'
end
