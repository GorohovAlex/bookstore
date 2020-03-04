class AddressController < ApplicationController
  def create
    authorize Address

    present AddressPresenter.new(user_id: current_user.id)

    @address_form = AddressForm.new(address_params)
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
    params_full = params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :user_id)
    params_full[:user_id] = current_user.id
    params_full
  end
end
