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

    def billing_address_info_items
      owner.billing_address.decorate.address_info_items
    end

    def shipments_info_items
      [
        owner.order_delivery.delivery.name,
        owner.order_delivery.delivery.days
      ]
    end

    def payment_info_items
      [
        owner.order_card.decorate.hidden_number,
        owner.order_card.date_expiry
      ]
    end
  end
end
