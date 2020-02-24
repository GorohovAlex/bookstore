require_relative 'account_remove_form'
require_relative 'email_form'
require_relative 'address_form'
require_relative 'password_form'

class UserSettings < SitePrism::Page
  set_url '/user'

  element :privacy_tab_link, '#privacy-tab-link'

  section :billing_address_form,  AddressForm,       'form#new_users_billing_address_form'
  section :shipping_address_form, AddressForm,       'form#new_users_shipping_address_form'
  section :email_form,            EmailForm,         'form#new_users_email_form'
  section :passwords_form,        PasswordsForm,     'form#address_form_new_users_password_form'
  section :account_remove_form,   AccountRemoveForm, 'form#remove_account_form'
end
