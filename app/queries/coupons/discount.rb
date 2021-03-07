module Coupons
  class Discount
    def self.call(coupon: nil)
      return 0 if coupon.nil?

      -(Coupon.find_by(['name = ? AND count > ?', coupon, 0])&.discount || 0)
    end
  end
end
