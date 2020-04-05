class AddressPresenter < BasePresenter
  attribute :billing_address_form, BillingAddressForm
  attribute :shipping_address_form, ShippingAddressForm

  def billing_address_form
    params = (owner.is_a? Order) && !owner.billing_address.present? ? owner.user : owner
    @billing_address_form || BillingAddress.find_or_initialize_by(owner: params)
  end

  def shipping_address_form
    params = (owner.is_a? Order) && !owner.shipping_address.present? ? owner.user : owner
    @shipping_address_form || ShippingAddress.find_or_initialize_by(owner: params)
  end
end
