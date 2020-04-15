class DeliveryService < CheckoutBaseService
  def call
    if delivery_params[:order_delivery].blank?
      @notice = I18n.t('.no_item_selected')
      return
    end

    delivery = Delivery.find_by!(id: delivery_params[:order_delivery].to_i)
    order_delivery = OrderDelivery.find_or_initialize_by(order: current_order)
    order_delivery.delivery_id = delivery.id

    current_order.to_payment! if @current_order.update(order_delivery: order_delivery)
  end

  def presenter
    Checkouts::DeliveryPresenter.new(notice: @notice)
  end

  private

  def delivery_params
    @params.require(:order).permit(:order_delivery)
  end
end
