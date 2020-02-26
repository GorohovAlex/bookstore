require_relative 'account_remove_form_section'
require_relative 'email_form_section'
require_relative 'address_form_section'
require_relative 'passwords_form_section'

module Pages
  class UserSettingsPage < SitePrism::Page
    set_url '/user'

    element :privacy_tab_link, '#privacy-tab-link'

    section :billing_address_form,  AddressFormSection,       'form#new_users_billing_address_form'
    section :shipping_address_form, AddressFormSection,       'form#new_users_shipping_address_form'
    section :email_form,            EmailFormSection,         'form#new_users_email_form'
    section :passwords_form,        PasswordsFormSection,     'form#address_form_new_users_password_form'
    section :account_remove_form,   AccountRemoveFormSection, 'form#remove_account_form'
  end
end
