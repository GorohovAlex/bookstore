class CheckoutEmailLoginPage < BasePage
  set_url '/checkout_email_login'

  section :returning_customer_email, FormGroupInputSection, '.user_email'
  section :returning_customer_password, FormGroupInputSection, '.user_password'
  element :returning_customer_submit, '#user_submit'

  section :quick_registrate_email, FormGroupInputSection, '.quick_registrate_email'
  element :quick_registrate_submit, '#quick_registrate_submit'
end
