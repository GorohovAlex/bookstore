class PaymentService
  def initialize(current_order:, params: [])
    @current_order = current_order
    @params = params
  end

  def call
    card_form.save
  end

  def presenter
    PaymentPresenter.new(card_form: card_form, order: @current_order)
  end

  private

  def card_params(params)
    params.permit(:number, :name, :date_expiry, :cvv).merge(order_id: @current_order.id)
  end

  def card_form
    @card_form ||= CardForm.new(card_params(@params[:order][:card] || @params[:order][:card_form]))
  end
end
