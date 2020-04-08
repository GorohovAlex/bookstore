module Checkouts
  class PaymentPresenter < BasePresenter
    attribute :order_card_form, OrderCardForm

    def order_card_form
      @order_card_form || OrderCard.find_or_initialize_by(order: owner)
    end
  end
end
