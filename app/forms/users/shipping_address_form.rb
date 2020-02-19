module Users
  class ShippingAddressForm < AddressForm
    private

    def persist!
      @shipping_address = user.shipping_address || ShippingAddress.new(user: user)
      @shipping_address.first_name = first_name
      @shipping_address.last_name = last_name
      @shipping_address.address = address
      @shipping_address.city = city
      @shipping_address.zip = zip
      @shipping_address.country = country
      @shipping_address.phone = phone
      @shipping_address.save
    end
  end
end
