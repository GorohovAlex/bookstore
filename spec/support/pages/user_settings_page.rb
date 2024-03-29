require_relative 'sections/address_form_section'
require_relative 'sections/email_form_section'
require_relative 'sections/passwords_form_section'
require_relative 'sections/account_remove_form_section'

class UserSettingsPage < SitePrism::Page
  set_url '/user'

  element :address_tab_link, '#address-tab-link'
  element :privacy_tab_link, '#privacy-tab-link'
  element :notice, '#notice'

  section :billing_address_form,      AddressFormSection,       'form#billing_address_form'
  section :shipping_address_form,     AddressFormSection,       'form#shipping_address_form'
  section :email_form,                EmailFormSection,         'form#new_users_email_form'
  section :passwords_form,            PasswordsFormSection,     'form#address_form_new_password_form'
  section :account_remove_form,       AccountRemoveFormSection, 'form#remove_account_form'
end
