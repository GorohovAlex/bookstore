class AddressController < ApplicationController
  def create
    present Users::AddressPresenter.new(owner: current_user)
    @address_form = AddressForm.new(address_params)
    authorize @address_form.record, policy_class: AddressPolicy

    respond_to_form(@address_form.save)
  end

  private

  def address_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :owner)
          .merge(owner: current_user)
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
