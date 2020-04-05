  class CheckoutShowService < CheckoutBaseService
    def call
      @current_order.aasm_state
    end
  end
