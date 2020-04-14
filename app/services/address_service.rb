class AddressService < CheckoutBaseService
  def call
    if use_billing_address
      billing_address.save ? @current_order.to_delivery! : nil
    else
      valid_all_address? ? save_all_address : nil
    end
  end

  def presenter
    Checkouts::AddressPresenter.new(owner: @current_order, billing_address_form: billing_address,
                                    shipping_address_form: shipping_address)
  end

  private

  def address_params(params)
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :owner)
          .merge(owner: @current_order)
  end

  def save_all_address
    billing_valid = billing_address.save
    shipping_valid = shipping_address.save

    @current_order.to_delivery! if billing_valid && shipping_valid
  end

  def valid_all_address?
    billing_valid = billing_address.valid?
    shipping_valid = shipping_address.valid?

    billing_valid && shipping_valid
  end

  def billing_address
    params = @params[:order][:billing_address] || @params[:order][:billing_address_form]
    @billing_address ||= BillingAddressForm.new(address_params(params))
  end

  def shipping_address
    params = @params[:order][:shipping_address] || @params[:order][:shipping_address_form]
    @shipping_address ||= ShippingAddressForm.new(address_params(params))
  end

  def use_billing_address
    use_billing_address = ActiveModel::Type::Boolean.new.cast(@params[:order][:use_billing_address])
    @current_order.update(use_billing_address: use_billing_address)
    use_billing_address
  end
end
