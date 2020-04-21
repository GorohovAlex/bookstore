class CheckoutBaseService
  CHECKOUT_STATUSES = %w[address delivery payment confirm complete].freeze

  def initialize(current_user: nil, params: {})
    @current_user = current_user
    @params = params
    @coupon = Coupon.find_by(name: params[:coupon])&.name
  end

  def call
    raise NoMethodError
  end

  def current_order
    @current_order ||= @params[:orders].where(aasm_state: CHECKOUT_STATUSES).last || Order.create(user: @current_user)
  end

  def presenter
    raise NoMethodError
  end
end
