class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  include Rectify::ControllerHelpers

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def user_not_authorized
    flash[:alert] = t('.not_authorized')
    redirect_path = request.url.eql?(checkout_email_login_url) ? new_checkout_path : root_path
    redirect_to(redirect_path)
  end

  def after_sign_in_path_for(_resource_or_scope)
    case request.referrer
    when checkout_email_login_url then new_checkout_path
    else
      root_path
    end
  end

  def parameter_missing
    flash[:alert] = t('.parameter_missin')
    redirect_to(request.referrer || root_path)
  end
end
