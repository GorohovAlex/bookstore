  class CheckoutUpdateService < CheckoutBaseService
    SERVICE_SUFFIX = 'Service'.freeze

    def call
      state_to_class.new(current_order: @current_order, params: @params)
    end

    private

    def state_to_class
      (@current_order.aasm_state + SERVICE_SUFFIX).singularize.camelize.constantize
    end
  end
