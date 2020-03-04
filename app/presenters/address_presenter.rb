class AddressPresenter < Rectify::Presenter
  attribute :user_id, Integer

  def billing_address_form
    User.find_by(id: user_id)&.billing_address || BillingAddress.new(user_id: user_id)
  end

  def shipping_address_form
    User.find_by(id: user_id)&.shipping_address || ShippingAddress.new(user_id: user_id)
  end
end
