class PasswordsFormSection < SitePrism::Section
  element :password_old,          'input[type="password"]#address_form_users_password_form_old_password'
  element :password_new,          'input[type="password"]#address_form_users_password_form_password'
  element :password_confirmation, 'input[type="password"]#address_form_users_password_form_password_confirmation'
  element :submit,                'input[type="submit"]'
end
