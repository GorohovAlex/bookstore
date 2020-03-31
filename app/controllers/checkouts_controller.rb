class CheckoutsController < ApplicationController
  before_action :authorize_resource, only: %i[show]

  def show
    @presenter = AddressPresenter.new(owner: current_order)
    render CheckoutShowService.new(current_order: current_order).call
  end

  def update
    service = CheckoutUpdateService.new(current_order: current_order, params: params).call

    if service.call
      redirect_to checkout_path
    else
      @presenter = service.presenter
      render CheckoutShowService.new(current_order: current_order).call
    end
  end

  private

  def current_order
    @current_order ||= Order.find_or_create_by(id: cookies[:current_order], user_id: current_user.id)
    cookies[:current_order] ||= @current_order.id
    @current_order
  end

  def authorize_resource
    authorize Checkout
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end
end
