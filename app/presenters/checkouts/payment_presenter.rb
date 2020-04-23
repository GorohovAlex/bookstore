module Checkouts
  class PaymentPresenter < CheckoutBasePresenter
    attribute :order_card_form, OrderCardForm

    def initialize(owner: nil, coupon_name: nil, summary_items: nil, order_card_form: nil)
      super(owner: owner, coupon_name: coupon_name, summary_items: summary_items)
      @order_card_form = order_card_form
    end

    def order_card_form
      @order_card_form || OrderCard.find_or_initialize_by(order: owner)
    end
  end
end
