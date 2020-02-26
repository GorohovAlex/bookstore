require_relative 'form_group_input_section'

class AddressFormSection < SitePrism::Section
  section :first_name, FormGroupInputSection, '.first-name-group input'
  element :last_name,  '.last-name-group input'
  element :address,    '.address-group input'
  element :city,       '.city-group input'
  element :zip,        '.zip-group input'
  element :country,    '.country-group select'
  element :phone,      '.phone-group input'
  element :submit,     'input[type="submit"]'
end
