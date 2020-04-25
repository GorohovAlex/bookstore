module Checkouts
  class AddressPresenter < CheckoutBasePresenter
    attribute :billing_address_form, BillingAddressForm
    attribute :shipping_address_form, ShippingAddressForm

    def billing_address_form
      @billing_address_form || BillingAddress.find_or_initialize_by(owner: billing_address_params)
    end

    def shipping_address_form
      @shipping_address_form || ShippingAddress.find_or_initialize_by(owner: shipping_address_params)
    end

    private

    def billing_address_params
      (owner.is_a? Order) && owner.billing_address.blank? ? owner.user : owner
    end

    def shipping_address_params
      (owner.is_a? Order) && owner.shipping_address.blank? ? owner.user : owner
    end
  end
end
