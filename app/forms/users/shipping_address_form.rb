module Users
  class ShippingAddressForm < AddressForm
    MODEL_CLASS = 'ShippingAddress'.freeze

    private

    # rubocop:disable Metrics/AbcSize
    def persist!
      @shipping_address = user.shipping_address || self.class::MODEL_CLASS.constantize.new(user: user)
      @shipping_address.first_name = first_name
      @shipping_address.last_name = last_name
      @shipping_address.address = address
      @shipping_address.city = city
      @shipping_address.zip = zip
      @shipping_address.country = country
      @shipping_address.phone = phone
      @shipping_address.save
    end
    # rubocop:enable Metrics/AbcSize
  end
end
