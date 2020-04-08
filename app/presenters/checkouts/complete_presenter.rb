module Checkouts
  class CompletePresenter < BasePresenter
    def initialize(owner: nil, coupon: nil)
      super
      @summary_items = OrderItemSummaryPresenter.new(order: owner, coupon: coupon)
    end

    def cart_items
      @cart_items ||= OrderItem.where(order: @owner)
    end

    def order_items
      @order_items ||= OrderItem.where(order: @owner)
    end

    def shipping_address_info_items
      return owner.billing_address.decorate.address_info_items if owner.use_billing_address

      owner.shipping_address.decorate.address_info_items
    end
  end
end
