module Users
  class AddressController < ApplicationController
    def update
      @address_form = Users::AddressForm.new(params: address_params, user: current_user)
      respond_to_form(@address_form.save)
    end

    private

    def address_params
      params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type)
    end

    def respond_to_form(success)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('.successful_message', type: @address_form.type) } }
        else
          format.html { render 'devise/user/edit', status: :unprocessable_entity }
          format.js { render 'devise/user/edit' }
        end
      end
    end
  end
end
