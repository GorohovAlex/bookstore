class CheckoutsController < ApplicationController
  before_action :authorize_resource, only: %i[new]
  
  # include Wicked::Wizard
  # steps(*Order.aasm.states.map(&:name))

  def show
    render CheckoutShowService.new(current_order: current_order).call
  end

  def update
    CheckoutUpdateService.new(current_order: current_order, params: params).call
  end

  private

  def current_order
    cookies[:current_order] || Order.new
  end

  def authorize_resource
    authorize Checkout
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end
end
