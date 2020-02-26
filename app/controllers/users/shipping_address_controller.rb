module Users
  class ShippingAddressController < AddressController
    def update
      shipping_params = address_params(:users_shipping_address_form)
      @shipping_address_form = Users::ShippingAddressForm.new(shipping_params)
      respond_to_form(@shipping_address_form.save)
    end
  end
end
