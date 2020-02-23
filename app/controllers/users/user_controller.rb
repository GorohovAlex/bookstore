module Users
  class UserController < Devise::RegistrationsController
    before_action :set_authorize

    def password
      params_password = params.require(:users_password_form).permit(:old_password, :password, :password_confirmation)
      params_password[:user] = current_user
      @password_form = Users::PasswordForm.new(params_password)

      respond_to do |format|
        format.js do
          flash[:notice] = @password_form.save ? t('.successful_message') : nil
          render :index
        end
      end
    end

    def email
      respond_to do |format|
        format.js do
          flash[:notice] = current_user.update(email: params[:user][:email]) ? t('.successful_message') : nil
          render :index
        end
      end
    end

    def billing_address
      params_address = params.require(:users_billing_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @billing_address_form = Users::BillingAddressForm.new(params_address)
      respond_to do |format|
        format.js do
          flash[:notice] = @billing_address_form.save ? t('.successful_message') : nil
          render :index
        end
      end
    end

    def shipping_address
      params_address = params.require(:users_shipping_address_form)
                             .permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      params_address[:user] = current_user
      @shipping_address_form = Users::ShippingAddressForm.new(params_address)
      respond_to do |format|
        format.js do
          flash[:notice] = @shipping_address_form.save ? t('.successful_message') : nil
          render :index
        end
      end
    end

    private

    def set_authorize
      authorize User
    end
  end
end
