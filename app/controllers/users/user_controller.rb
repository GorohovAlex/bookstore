module Users
  class UserController < Devise::RegistrationsController
    before_action :set_authorize, only: %i[index password]

    def password
      params_password = params.require(:users_password_form).permit(:old_password, :password, :password_confirmation)
      params_password[:user] = current_user
      @password_form = Users::PasswordForm.new(params_password)
      respond_to_form(@password_form.save)
    end

    def email
      respond_to_form(current_user.update(email: params[:user][:email]))
    end

    def billing_address
      params_address = params.require(:users_billing_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @billing_address_form = Users::BillingAddressForm.new(params_address)
      respond_to_form(@billing_address_form.save)
    end

    def shipping_address
      params_address = params.require(:users_shipping_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @shipping_address_form = Users::ShippingAddressForm.new(params_address)
      respond_to_form(@shipping_address_form.save)
    end

    private

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

    def set_authorize
      authorize User
    end
  end
end
