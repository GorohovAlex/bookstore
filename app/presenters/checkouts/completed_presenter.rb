module Checkouts
  class CompletedPresenter < CheckoutBasePresenter
    def initialize(owner: nil, coupon_name: nil, user_id: nil)
      super
      @summary_items = OrderItemSummaryPresenter.new(order: owner, coupon: coupon_name)
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
