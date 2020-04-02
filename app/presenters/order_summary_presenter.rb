class OrderSummaryPresenter < Rectify::Presenter
  def initialize(user_id: nil, session_id: nil, coupon: nil)
    @cart_item_service = CartItemService.new(user_id: user_id, session_id: session_id, coupon: coupon)
  end

  def order_summary
    items
  end

  def items
    @items ||= {
      item_total: @cart_item_service&.cart_sub_total,
      coupon: @cart_item_service&.discount,
      order_total: @cart_item_service&.order_total
    }
  end
end
