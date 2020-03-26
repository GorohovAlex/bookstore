module CartItems
  class OrderTotal
    def self.call(user_id: nil, session_id: nil, coupon: nil)
      discount = Coupons::Discount.call(coupon: coupon).to_money
      cart_sub_total = CartItems::SubTotal.call(user_id: user_id, session_id: session_id)
      discount.abs < cart_sub_total ? cart_sub_total + discount : 0
    end
  end
end
