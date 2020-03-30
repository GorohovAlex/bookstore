class CheckoutShowService
  def initialize(current_order:, params: [])
    @current_order = current_order
    @params = params
  end

  def call
    @current_order.aasm_state
  end
end
