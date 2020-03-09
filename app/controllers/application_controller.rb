class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  include Rectify::ControllerHelpers

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
