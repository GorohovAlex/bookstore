class OrderItemSummaryPresenter < SummaryPresenter
  def initialize(order: nil, coupon: nil)
    @order = order
    @coupon = coupon
  end

  def items
    {
      item_total: item_total,
      coupon: discount,
      delivery: delivery,
      order_total: order_total
    }
  end

  private

  def item_total
    # byebug
    @order.user.cart_item.joins(:book).sum('price_cents * quantity / 100').to_money
    # @order.order_items.sum('price_cents * quantity / 100').to_money
  end

  def discount
    @discount ||= Coupons::Discount.call(coupon: @coupon).to_money
  end

  def delivery
    @delivery ||= @order.order_delivery&.delivery&.price || 0
  end

  def order_total
    item_total + discount + delivery
  end
end
