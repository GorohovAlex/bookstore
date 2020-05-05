class CheckoutShowService < CheckoutBaseService
  PRESENTER_SUFIX = 'Presenter'.freeze
  PRESENTER_PREFIX = 'Checkouts::'.freeze

  def current_state
    current_order.aasm_state
  end

  def presenter
    presenter_name.constantize.new(owner: current_order, coupon_name: coupon&.name, user_id: @current_user.id)
  end

  private

  def presenter_name
    "#{PRESENTER_PREFIX}#{current_order.aasm_state.singularize.camelize}#{PRESENTER_SUFIX}"
  end
end
