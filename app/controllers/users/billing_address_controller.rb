module Users
  class BillingAddressController < AddressController
    def update
      billing_params = address_params(:users_billing_address_form)
      @billing_address_form = Users::BillingAddressForm.new(billing_params)
      respond_to_form(@billing_address_form.save)
    end
  end
end
