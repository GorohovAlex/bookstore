module Devise
  class UserController < Devise::RegistrationsController
    include Rectify::ControllerHelpers

    before_action :authorize_resource, only: %i[index password email]

    def edit
      present AddressPresenter.new(user_id: current_user.id)
    end

    def update
      return password if params.key?(:password_form)
      return email if params.key?(:user)
    end

    private

    def password
      params_password = password_params
      params_password[:user_id] = current_user.id
      @password_form = PasswordForm.new(params_password)
      respond_to_form(@password_form.save)
    end

    def email
      respond_to_form(current_user.update(email: params[:user][:email]))
    end

    def password_params
      params.require(:password_form).permit(:old_password, :password, :password_confirmation)
    end

    def respond_to_form(success)
      present AddressPresenter.new(user_id: current_user.id)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('.successful_message') } }
        else
          format.js { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def authorize_resource
      authorize User
    end
  end
end
