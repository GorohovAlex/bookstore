module Checkouts
  class DeliveryPresenter < CheckoutBasePresenter
    def initialize(notice: nil, owner: nil, coupon_name: nil)
      super(owner: owner, coupon_name: coupon_name)
      @notice = notice
    end

    def delivery_all
      Delivery.all
    end
  end
end
