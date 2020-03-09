require_relative 'form_group_input_section'
require_relative 'form_group_select_section'

class AddressFormSection < SitePrism::Section
  section :first_name, FormGroupInputSection,  '.first-name-group'
  section :last_name,  FormGroupInputSection,  '.last-name-group'
  section :address,    FormGroupInputSection,  '.address-group'
  section :city,       FormGroupInputSection,  '.city-group'
  section :zip,        FormGroupInputSection,  '.zip-group'
  section :country,    FormGroupSelectSection, '.country-group'
  section :phone,      FormGroupInputSection,  '.phone-group'
  element :submit,     'input[type="submit"]'
end
