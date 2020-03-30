class AddressesService
  def initialize(current_order:, params: [])
    @current_order = current_order
    @params = params
  end

  def call
    billing_params = @params[:order][:billing_address] || @params[:order][:billing_address_form]
    shipping_params = @params[:order][:shipping_address] || @params[:order][:shipping_address_form]
    
    @billing_address = BillingAddressForm.new(address_params(billing_params))
    billing_valid = @billing_address.valid?
    
    @shipping_address = ShippingAddressForm.new(address_params(shipping_params))
    shipping_valid = @shipping_address.valid?

    return unless billing_valid && shipping_valid 

    @billing_address.save
    @shipping_address.save

    true
  end
  
  def presenter
    AddressPresenter.new(owner: @current_order, billing_address_form: @billing_address, shipping_address_form: @shipping_address)
  end

  private
  
  def address_params(params)
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :type, :owner)
          .merge(owner: @current_order)
  end

end
