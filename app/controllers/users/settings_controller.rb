module Users
  class SettingsController < ApplicationController
    def update_password
      params_password = params.require(:users_password_form).permit(:old_password, :password, :password_confirmation)
      params_password[:user] = current_user
      @password_form = Users::PasswordForm.new(params_password)
      if @password_form.save
        redirect_to root_path, notice: 'Signup successfull.'
      else
        render :update
      end
    end

    def update_email
      if current_user.update(email: params[:user][:email])
        redirect_to user_settings_path
      else
        render :update
      end
    end

    def update_billing_address
      params_address = params.require(:users_billing_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @billing_address_form = Users::BillingAddressForm.new(params_address)
      if @billing_address_form.save
        redirect_to user_settings_path, notice: 'Signup successfull.'
      else
        render :update
      end
    end

    def update_shipping_address
      params_address = params.require(:users_shipping_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @shipping_address_form = Users::ShippingAddressForm.new(params_address)
      if @shipping_address_form.save
        redirect_to user_settings_path, notice: 'Signup successfull.'
      else
        render :update
      end
    end
  end
end
