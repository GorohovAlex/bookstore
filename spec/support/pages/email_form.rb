class EmailForm < SitePrism::Section
  element :email,  'input#user_email'
  element :submit, 'input[type="submit"]'
end
