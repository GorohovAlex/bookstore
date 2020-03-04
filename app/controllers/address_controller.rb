class AddressController < ApplicationController
  before_action :authorize_resource, only: %i[create]

  def create
    @address_form = AddressForm.new(address_params)
    respond_to_form(@address_form.save)
  end

  private

  def address_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :user_id)
          .merge(user_id: current_user.id)
  end

  def authorize_resource
    authorize Address
  end

  def respond_to_form(_success)
    present AddressPresenter.new(user_id: current_user.id)
    respond_to do |format|
      if @address_form.save
        format.html { redirect_to user_path, flash: { notice: t('.successful_message', type: @address_form.type) } }
      else
        format.js { render 'devise/user/edit', status: :unprocessable_entity }
      end
    end
  end
end
