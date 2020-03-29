class CartItemService
  def initialize(user_id: nil, session_id: nil, coupon: nil)
    @user_id = user_id
    @session_id = session_id
    @coupon = coupon
  end

  def cart_sub_total
    @cart_sub_total ||= CartItems::SubTotal.call(user_id: @current_user_id, session_id: @session_id)
  end

  def discount
    @discount ||= Coupons::Discount.call(coupon: @coupon).to_money
  end

  def order_total
    @order_total = discount.abs < cart_sub_total ? cart_sub_total + discount : 0
  end

  def join_cart_items
    CartItem.where(session_id: @session_id).update(user_id: @user_id)
  end
end
