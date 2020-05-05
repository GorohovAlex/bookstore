module Checkouts
  class CompletedPresenter < CheckoutInfoPresenter
    def summary_items
      @summary_items ||= OrderItemCompleteSummaryPresenter.new(order: owner, coupon: coupon_name).items
    end

    def cart_items
      @cart_items ||= OrderItem.includes(:book).where(order: @owner)
    end

    def order_items
      @order_items ||= OrderItem.includes(:book).where(order: @owner)
    end
  end
end
