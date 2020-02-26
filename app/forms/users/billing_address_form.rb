module Users
  class BillingAddressForm < AddressForm
    MODEL_CLASS = 'BillingAddress'.freeze

    private

    # rubocop:disable Metrics/AbcSize
    def persist!
      @billing_address = user.billing_address || self.class::MODEL_CLASS.constantize.new(user: user)
      @billing_address.first_name = first_name
      @billing_address.last_name = last_name
      @billing_address.address = address
      @billing_address.city = city
      @billing_address.zip = zip
      @billing_address.country = country
      @billing_address.phone = phone
      @billing_address.save
    end
    # rubocop:enable Metrics/AbcSize
  end
end
