module Devise
  class UserController < Devise::RegistrationsController
    include Rectify::ControllerHelpers

    # before_action :authenticate_user!, only: %i[index update]
    before_action :authorize_resource, only: %i[index update]

    def edit
      present AddressPresenter.new(user_id: current_user.id)
    end

    def update
      present AddressPresenter.new(user_id: current_user.id)

      return password if params.key?(:password_form)
      return email if params.key?(:user)
    end

    private

    def password
      @password_form = PasswordForm.new(password_params)
      respond_to_form(@password_form.save)
    end

    def email
      respond_to_form(current_user.update(email: params[:user][:email]))
    end

    def password_params
      params.require(:password_form)
            .permit(:old_password, :password, :password_confirmation)
            .merge(id: current_user.id)
    end

    def respond_to_form(success)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('.successful_message') } }
        else
          format.js { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def authorize_resource
      authorize current_user
    end
  end
end
