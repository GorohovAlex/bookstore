require_relative 'form_group_input_section'

class CardFormSection < SitePrism::Section
  section :card_number, FormGroupInputSection, '.number-group'
  section :card_name,   FormGroupInputSection, '.name-group'
  section :date_expiry, FormGroupInputSection, '.date-expiry-group'
  section :card_cvv,    FormGroupInputSection, '.cvv-group'
end
