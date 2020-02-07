class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) do |u|
        u.permit :email, :password
      end
    end
end
