class CompletePresenter < BasePresenter
  def cart_items
    @cart_items ||= CartItems::AllItems.call(user_id: @owner.user.id)
  end

  def shipping_address_info_items
    return billing_address_info_items if owner.use_billing_address

    address_info_items(owner.shipping_address)
  end

  private

  def address_info_items(address)
    [
      "#{address.first_name} #{address.last_name}",
      address.address,
      address.city,
      address.country,
      I18n.t('.phone', number: address.phone)
    ]
  end
end
