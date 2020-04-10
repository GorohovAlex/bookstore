class CheckoutsController < ApplicationController
  before_action :authorize_resource, only: %i[new]

  def new; end

  private

  def authorize_resource
    authorize Order
  end

  def user_not_authorized
    redirect_to(checkout_email_login_path)
  end
end
