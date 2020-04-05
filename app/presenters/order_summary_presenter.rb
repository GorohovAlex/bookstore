class OrderSummaryPresenter < Rectify::Presenter
  def initialize(user_id: nil, session_id: nil, coupon: nil, order: nil)
    @cart_item_service = CartItemService.new(user_id: user_id, session_id: session_id, coupon: coupon)
    @order = order
    @items = {}
  end

  def order_summary
    items
  end

  def items
    @items[:item_total]  = item_total
    @items[:coupon]      = coupon unless coupon.zero?
    @items[:delivery]    = delivery || 0 if delivery.present?
    @items[:order_total] = order_total
    @items
  end

  private

  def item_total
    @item_total ||= @cart_item_service.cart_sub_total
  end

  def coupon
    @coupon ||= @cart_item_service.discount
  end

  def delivery
    @delivery ||= @order.order_delivery&.delivery&.price
  end

  def order_total
    item_total + coupon + (delivery || 0)
  end
end
