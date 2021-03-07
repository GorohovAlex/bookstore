class CheckoutUpdateService < CheckoutBaseService
  SERVICE_SUFFIX = 'Service'.freeze

  def call
    state_to_class.new(current_user: @current_user, params: @params)
  end

  private

  def state_to_class
    (current_order.aasm_state + SERVICE_SUFFIX).singularize.camelize.constantize
  end
end
