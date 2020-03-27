class AddressPresenter < Rectify::Presenter
  attribute :owner, Object

  def billing_address_form
    BillingAddress.find_or_initialize_by(owner: owner)
  end

  def shipping_address_form
    ShippingAddress.find_or_initialize_by(owner: owner)
  end
end
