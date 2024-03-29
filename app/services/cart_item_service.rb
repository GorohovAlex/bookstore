class CartItemService
  def initialize(user_id: nil, session_id: nil, coupon_name: nil)
    @user_id = user_id
    @session_id = session_id
    @coupon_name = coupon_name
  end

  def create(cart_item_params)
    CartItemForm.new(cart_item_params).save
  end

  def update_quantity(cart_item, quantity)
    cart_item.update(quantity: quantity)
  end

  def delete(cart_item)
    CartItem.destroy(cart_item.id)
  end

  def cart_sub_total
    @cart_sub_total ||= CartItems::SubTotal.call(user_id: @user_id, session_id: @session_id)
  end

  def discount
    @discount ||= Coupons::Discount.call(coupon: @coupon_name).to_money
  end

  def order_total
    @order_total = discount.abs < cart_sub_total ? cart_sub_total + discount : 0
  end

  def join_cart_items
    CartItem.where(session_id: @session_id).update(user_id: @user_id)
  end
end
