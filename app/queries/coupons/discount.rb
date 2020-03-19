module Coupons
  class Discount
    def self.call(coupon: nil)
      return 0 if coupon.nil?

      (Coupon.find_by(name: coupon)&.discount || 0) * -1
    end
  end
end
