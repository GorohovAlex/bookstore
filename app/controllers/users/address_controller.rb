module Users
  class AddressController < ApplicationController
    private

    def address_params(form)
      parameters = params.require(form).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
      parameters[:user] = current_user
      parameters
    end

    def respond_to_form(success)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('.successful_message') } }
        else
          format.html { render 'users/user/index', status: :unprocessable_entity }
          format.js { render 'users/user/index' }
        end
      end
    end
  end
end
