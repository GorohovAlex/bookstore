class AddressController < ApplicationController
  def create
    present AddressPresenter.new(user_id: current_user.id)
    @address_form = AddressForm.new(address_params)
    authorize @address_form.record, policy_class: AddressPolicy

    respond_to_form(@address_form.save)
  end

  private

  def address_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :user_id)
          .merge(user_id: current_user.id)
  end

  def respond_to_form(success)
    respond_to do |format|
      if success
        format.html { redirect_to user_path, flash: { notice: t('.successful_message', type: @address_form.type) } }
      else
        format.js { render 'devise/user/edit', status: :unprocessable_entity }
      end
    end
  end
end
