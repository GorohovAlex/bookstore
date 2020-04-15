class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  include Rectify::ControllerHelpers

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def user_not_authorized
    flash[:alert] = t('.not_authorized')
    redirect_to(request.referrer || root_path)
  end

  def parameter_missing
    flash[:alert] = t('.parameter_missin')
    redirect_to(request.referrer || root_path)
  end
end
