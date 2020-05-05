class CheckoutBaseService
  def initialize(current_user: nil, params: {})
    @current_user = current_user
    @params = params
  end

  def call
    raise NoMethodError
  end

  def coupon
    @coupon ||= Coupon.find_by(name: @params[:coupon])
  end

  def current_order
    @current_order ||= Order.not_finish_orders(@current_user.id).last || Order.create(user: @current_user)
  end

  def presenter
    raise NoMethodError
  end
end
