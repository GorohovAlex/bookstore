class CouponSection < SitePrism::Section
  element :name_input, 'input[type="text"]'
  element :submit,     'input[type="submit"]'
end
