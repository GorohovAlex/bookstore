module Users
  class UserController < Devise::RegistrationsController
    before_action :authorize_resource, only: %i[index password email]

    def password
      params_password = password_params
      params_password[:user] = current_user
      @password_form = Users::PasswordForm.new(params_password)
      respond_to_form(@password_form.save)
    end

    def email
      respond_to_form(current_user.update(email: params[:user][:email]))
    end

    private

    def password_params
      params.require(:users_password_form).permit(:old_password, :password, :password_confirmation)
    end

    def respond_to_form(success)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('.successful_message') } }
        else
          format.html { render :index, status: :unprocessable_entity }
          format.js { render :index }
        end
      end
    end

    def authorize_resource
      authorize User
    end
  end
end
