class CheckoutsController < ApplicationController
  layout 'checkout'
  before_action :authorize_resource, only: %i[show create update]
  # ALLOW_ORDER_STATUSES = [:address, :delivery, :payment, :confirm]

  def show
    return redirect_to root_path unless show_allow?

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
    @checkout_params ||= params.merge(coupon: cookies[:coupon])
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

  def show_allow?
    exist_cart = exist_cart_items?
    return !exist_cart if current_user.decorate.not_finish_orders.last&.complete?

    exist_cart
  end
end
