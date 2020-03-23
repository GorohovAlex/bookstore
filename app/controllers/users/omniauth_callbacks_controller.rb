module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        authentication_and_redirect(path_default: root_path)
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def authentication_and_redirect(path_default: '')
      sign_in(@user, event: :authentication)
      redirect_to redirect_path || path_default
    end

    def redirect_path
      case request.env['omniauth.origin']
      when new_user_session_url then root_path
      when new_user_registration_url then root_path
      else
        request.env['omniauth.origin']
      end
    end
  end
end
