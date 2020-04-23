class CheckoutBaseService
  def initialize(current_user: nil, params: {})
    @current_user = current_user
    @params = params
    @coupon = Coupon.find_by(name: params[:coupon])
  end

  def call
    raise NoMethodError
  end

  def current_order
    @current_order ||= @current_user.decorate.not_finish_orders.last || Order.create(user: @current_user)
  end

  def presenter
    raise NoMethodError
  end
end
