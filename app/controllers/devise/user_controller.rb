module Devise
  class UserController < Devise::RegistrationsController
    before_action :authorize_resource, only: %i[index update]

    def edit
      present Users::AddressPresenter.new(owner: current_user)
    end

    def update
      present AddressPresenter.new(owner: current_user)

      return password if params.key?(:password_form)
      return email if params.key?(:user)
    end

    def create
      return quick_registrate_user if quick_registrate?

      super
      CartItemService.new(user_id: current_user&.id, session_id: session.id.to_s).join_cart_items
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

    def quick_registrate_user
      build_user_params
      build_resource(sign_up_params)
      if resource.save
        quick_sing_in
      else
        redirect_to(checkout_email_login_path, notice: resource.errors.full_messages.join(','))
      end
    end

    def build_user_params
      password = ('A'..'Z').to_a.sample + SecureRandom.hex(8)
      params[:user] = {
        email: params[:quick_registrate][:email],
        password: password,
        password_confirmation: password
      }
    end

    def quick_sing_in
      resource.send_reset_password_instructions
      sign_up(resource_name, resource)
      redirect_to checkout_path
    end

    def quick_registrate?
      params[:quick_registrate]
    end

    def email_exist?
      User.find_by(email: params[:quick_registrate][:email])
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
