class AddressPresenter < Rectify::Presenter
  attribute :user_id, Integer

  def billing_address_form
    BillingAddress.find_or_initialize_by(user_id: user_id)
  end

  def shipping_address_form
    ShippingAddress.find_or_initialize_by(user_id: user_id)
  end
end
