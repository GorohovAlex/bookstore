module Checkouts
  class AddressPresenter < BasePresenter
    attribute :billing_address_form, BillingAddressForm
    attribute :shipping_address_form, ShippingAddressForm

    def initialize(owner: nil, billing_address_form: nil, shipping_address_form: nil, coupon: nil)
      @billing_address_form = billing_address_form
      @shipping_address_form = shipping_address_form
      super(owner: owner, coupon: coupon)
    end

    def billing_address_form
      params = (owner.is_a? Order) && !owner.billing_address.present? ? owner.user : owner
      @billing_address_form || BillingAddress.find_or_initialize_by(owner: params)
    end

    def shipping_address_form
      params = (owner.is_a? Order) && !owner.shipping_address.present? ? owner.user : owner
      @shipping_address_form || ShippingAddress.find_or_initialize_by(owner: params)
    end
  end
end
