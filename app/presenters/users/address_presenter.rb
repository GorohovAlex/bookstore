module Users
  class AddressPresenter < BasePresenter
    attribute :billing_address_form, BillingAddressForm
    attribute :shipping_address_form, ShippingAddressForm

    def billing_address_form
      @billing_address_form ||= BillingAddress.find_or_initialize_by(owner: owner)
    end

    def shipping_address_form
      @shipping_address_form ||= ShippingAddress.find_or_initialize_by(owner: owner)
    end
  end
end
