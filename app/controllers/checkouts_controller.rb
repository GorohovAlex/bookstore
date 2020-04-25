class CheckoutsController < ApplicationController
  layout 'checkout'
  before_action :authorize_resource, only: %i[show create update]
  before_action :checkout_allow?, only: %i[show update]

  def show
    presenter
    render show_service.current_state
  end

  def create
    if CheckoutShowService.new(current_user: current_user, params: checkout_params).current_order.completed?
      current_user.orders.create
    end
    show
  end

  def update
    return redirect_to checkout_path if update_service.call

    @presenter = update_service.presenter
    flash.now[:alert] = @presenter.notice

    render CheckoutShowService.new(current_user: current_user, params: checkout_params).current_state
  end

  private

  def update_service
    @update_service ||= CheckoutUpdateService.new(current_user: current_user, params: checkout_params).call
  end

  def show_service
    @show_service ||= CheckoutShowService.new(current_user: current_user, params: checkout_params)
  end

  def presenter
    @presenter ||= show_service.presenter
  end

  def state_to_class
    (current_order.aasm_state + SERVICE_SUFFIX).singularize.camelize.constantize
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

  def checkout_allow?
    exist_cart = exist_cart_items?
    exist_cart = !exist_cart if Order.not_finish_orders(current_user.id).last&.completed?
    return redirect_to root_path unless exist_cart
  end
end
