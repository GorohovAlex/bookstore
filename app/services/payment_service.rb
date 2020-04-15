class PaymentService < CheckoutBaseService
  def call
    current_order.to_confirm! if order_card_form.save
  end

  def presenter
    Checkouts::PaymentPresenter.new(order_card_form: order_card_form, owner: current_order)
  end

  private

  def card_params(params)
    params.permit(:number, :name, :date_expiry, :cvv).merge(order_id: current_order.id)
  end

  def order_card_form
    order_card = @params[:order][:order_card] || @params[:order][:order_card_form]
    @order_card_form ||= OrderCardForm.new(card_params(order_card))
  end
end
