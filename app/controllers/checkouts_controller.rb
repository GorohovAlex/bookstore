class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :authorize_resource, only: %i[new]
  steps(*Order.aasm.states.map(&:name))

  def show
    render_wizard
  end

  def create
    byebug
  end

  private

  def authorize_resource
    authorize Checkout
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end
end
