class SignUp < SitePrism::Page
  set_url '/users/sign_up'

  element :facebook_icon, '.fa-facebook-official'
  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :password_confirm_input, '#user_password_confirmation'
  element :sign_up_button, '#sign_up'
  element :email_invalid_feedback, '.email > .invalid-feedback'
end
