class CheckoutShowService < CheckoutBaseService
  PRESENTER_SUFIX = 'Presenter'.freeze
  PRESENTER_PREFIX = 'Checkouts::'.freeze

  def call
    current_order.aasm_state
  end

  def presenter
    presenter_name.constantize.new(owner: current_order, coupon_name: @coupon&.name)
  end

  private

  def presenter_name
    PRESENTER_PREFIX + (current_order.aasm_state + PRESENTER_SUFIX).singularize.camelize
  end
end
