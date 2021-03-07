require_relative 'checkout_base_page'
require_relative 'sections/card_form_section'

class CheckoutPaymentPage < CheckoutBasePage
  element  :order_summary,  '.order-summary'
  section  :card_form,      CardFormSection, '.card-form'
end
