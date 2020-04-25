class AddressService < CheckoutBaseService
  def call
    if use_billing_address
      billing_address.save ? current_order.deliver! : nil
    else
      valid_all_address? ? save_all_address : nil
    end
  end

  def presenter
    Checkouts::AddressPresenter.new(owner: current_order, billing_address_form: billing_address_form,
                                    shipping_address_form: shipping_address_form)
  end

  private

  def address_params(params)
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :owner)
          .merge(owner: current_order)
  end

  def save_all_address
    billing_valid = billing_address_form.save
    shipping_valid = shipping_address_form.save

    current_order.deliver! if billing_valid && shipping_valid
  end

  def valid_all_address?
    billing_valid = billing_address_form.valid?
    shipping_valid = shipping_address_form.valid?

    billing_valid && shipping_valid
  end

  def billing_address_form
    @billing_address_form ||= BillingAddressForm.new(address_params(billing_address_params))
  end

  def billing_address_params
    @params[:order][:billing_address] || @params[:order][:billing_address_form]
  end

  def shipping_address_form
    @shipping_address_form ||= ShippingAddressForm.new(address_params(shipping_address_params))
  end

  def shipping_address_params
    @params[:order][:shipping_address] || @params[:order][:shipping_address_form]
  end

  def use_billing_address
    use_billing_address = ActiveModel::Type::Boolean.new.cast(@params[:order][:use_billing_address])
    current_order.update(use_billing_address: use_billing_address)
    use_billing_address
  end
end
