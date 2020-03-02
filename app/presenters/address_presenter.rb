class AddressPresenter < Rectify::Presenter
  attribute :user, User

  def billing_address_form
    BillingAddressForm.new(user: user)
  end

  def shipping_address_form
    ShippingAddressForm.new(user: user)
  end
end
