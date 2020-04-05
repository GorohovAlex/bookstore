class ConfirmPresenter < BasePresenter
  CARD_NUMBER_VISIBLE_ITEMS = 4

  def billing_address_info_items
    address_info_items(owner.billing_address)
  end

  def shipping_address_info_items
    return billing_address_info_items if owner.use_billing_address

    address_info_items(owner.shipping_address)
  end

  def shipments_info_items
    [
      owner.order_delivery.delivery.name,
      owner.order_delivery.delivery.days
    ]
  end

  def payment_info_items
    [
      "** ** ** #{owner.card.number[-CARD_NUMBER_VISIBLE_ITEMS..-1]}",
      owner.card.date_expiry
    ]
  end

  def cart_items
    @cart_items ||= CartItems::AllItems.call(user_id: @owner.user.id)
  end

  private

  def address_info_items(address)
    [
      "#{address.first_name} #{address.last_name}",
      address.address,
      address.city,
      ISO3166::Country[address.country].name,
      I18n.t('.phone', number: address.phone)
    ]
  end
end
