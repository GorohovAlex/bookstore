class CheckoutsController < ApplicationController
  layout 'checkout'
  before_action :authorize_resource, only: %i[show]

  PRESENTER_SUFIX = 'Presenter'.freeze
  PRESENTER_PREFIX = 'Checkouts::'.freeze

  def show
    @presenter = presenter_name.constantize.new(owner: current_order, coupon: cookies[:coupon])
    render CheckoutShowService.new(current_order: current_order).call
  end

  def update
    return redirect_to checkout_path if update_service.call

    @presenter = update_service.presenter
    flash.now[:alert] = @presenter.notice
    render CheckoutShowService.new(current_order: current_order).call
  end

  private

  def update_service
    @update_service ||= CheckoutUpdateService.new(current_order: current_order,
                                                  params: params.merge(coupon: cookies[:coupon])).call
  end

  def order_policy
    @order_policy = OrderPolicy::Scope.new(current_user, Order).resolve
  end

  def presenter_name
    PRESENTER_PREFIX + (current_order.aasm_state + PRESENTER_SUFIX).singularize.camelize
  end

  def current_order
    order = order_policy.where(id: cookies[:current_order]).where.not(aasm_state: :complete).first
    @current_order = order || Order.create(user: current_user)

    cookies[:current_order] ||= @current_order.id
    @current_order
  end

  def authorize_resource
    authorize Checkout
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end

  def pundit_user
    { user: current_user, session_id: session.id.to_s, cart_item_id: params[:id] }
  end
end
