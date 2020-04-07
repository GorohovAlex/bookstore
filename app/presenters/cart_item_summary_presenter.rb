class CartItemSummaryPresenter < SummaryPresenter
  def initialize(user_id: nil, session_id: nil, coupon: nil)
    @service = CartItemService.new(user_id: user_id, session_id: session_id, coupon: coupon)
  end

  def summary
    {
      item_total: item_total,
      coupon: discount,
      order_total: order_total
    }
  end

  private

  def item_total
    @item_total ||= @service.cart_sub_total
  end

  def discount
    @discount ||= @service.discount
  end

  def order_total
    item_total + discount
  end
end
