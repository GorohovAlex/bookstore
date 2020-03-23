class CheckoutsController < ApplicationController
  before_action :authorize_resource, only: %i[show]

  def show; end

  private

  def authorize_resource
    authorize Checkout.new
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end
end
