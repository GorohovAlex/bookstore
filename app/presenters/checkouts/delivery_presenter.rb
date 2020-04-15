module Checkouts
  class DeliveryPresenter < CheckoutBasePresenter
    def initialize(notice: nil, owner: nil, coupon: nil)
      super(owner: owner, coupon: coupon)
      @notice = notice
    end
  end
end
