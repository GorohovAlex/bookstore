module Checkouts
  class PaymentPresenter < CheckoutBasePresenter
    attribute :order_card_form, OrderCardForm
    def order_card_form
      @order_card_form || OrderCardForm.new
    end
  end
end
