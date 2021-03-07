class OrderItemSection < SitePrism::Section
  element :number,     '.number'
  element :created_at, '.created_at'
  element :status,     '.status'
  element :total,      '.total'
end
