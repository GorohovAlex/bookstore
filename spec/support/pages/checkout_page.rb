require_relative 'base_page'
require_relative 'sections/steps_section'

class CheckoutPage < BasePage
  set_url '/checkout'

  section :steps,                 StepsSection,       '.steps.list-inline'
  section :billing_address_form,  AddressFormSection, '#billing_address_box'
  section :shipping_address_form, AddressFormSection, '#shipping_address_box'
  element :use_billing_address,   '#use_billing_address'
  element :order_summary,         '.order-summary'
  element :save_button,           '.btn'
end
