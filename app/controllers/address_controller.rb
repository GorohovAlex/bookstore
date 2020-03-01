class AddressController < ApplicationController
  def create
    @address_form = AddressForm.new(params: address_params, user: current_user)
    respond_to do |format|
      if @address_form.save
        format.html { redirect_to user_path, flash: { notice: t('.successful_message', type: @address_form.type) } }
      else
        format.js { render 'devise/user/edit', status: :unprocessable_entity }
      end
    end
  end

  private

  def address_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type)
  end
end
