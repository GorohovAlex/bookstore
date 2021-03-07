require_relative 'checkout_base_page'
require_relative 'sections/address_form_section'

class CheckoutAddressPage < CheckoutBasePage
  section :billing_address_form,  AddressFormSection, '#billing_address_box'
  section :shipping_address_form, AddressFormSection, '#shipping_address_box'
  element :use_billing_address,   '#use_billing_address'
  element :order_summary,         '.order-summary'
end
