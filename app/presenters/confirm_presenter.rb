class ConfirmPresenter < BasePresenter
  def billing_address_info_items
    owner.billing_address.decorate.address_info_items
  end

  def shipping_address_info_items
    return owner.billing_address.decorate.address_info_items if owner.use_billing_address

    owner.billingshipping_address.decorate.address_info_items
  end

  def shipments_info_items
    [
      owner.order_delivery.delivery.name,
      owner.order_delivery.delivery.days
    ]
  end

  def payment_info_items
    [
      owner.order_card.decorate.hidden_number,
      owner.order_card.date_expiry
    ]
  end

  def cart_items
    @cart_items ||= CartItems::AllItems.call(user_id: @owner.user.id)
  end
end
