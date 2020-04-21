class CheckoutsController < ApplicationController
  layout 'checkout'
  before_action :authorize_resource, only: %i[show create update]

  def show
    return redirect_to root_path unless exist_cart_items?

    checkout_show_service = CheckoutShowService.new(current_user: current_user, params: checkout_params)
    @presenter = checkout_show_service.presenter
    render checkout_show_service.call
  end

  def create
    if CheckoutShowService.new(current_user: current_user, params: checkout_params).current_order.complete?
      current_user.orders.create
    end
    show
  end

  def update
    return redirect_to checkout_path if update_service.call

    @presenter = update_service.presenter
    flash.now[:alert] = @presenter.notice
    render CheckoutShowService.new(current_user: current_user, params: checkout_params).call
  end

  private

  def update_service
    @update_service ||= CheckoutUpdateService.new(current_user: current_user, params: checkout_params).call
  end

  def checkout_params
    @checkout_params ||= params.merge(coupon: cookies[:coupon], orders: order_policy)
  end

  def order_policy
    @order_policy = OrderPolicy::Scope.new(current_user, Order).resolve
  end

  def authorize_resource
    authorize Order
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end

  def exist_cart_items?
    current_user.cart_item.present?
  end
end
