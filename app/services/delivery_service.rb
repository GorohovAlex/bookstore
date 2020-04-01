class DeliveryService
  def initialize(current_order:, params: [])
    @current_order = current_order
    @params = params
  end

  def call
    delivery = Delivery.find_by!(id: @params[:order][:order_delivery].to_i)
    order_delivery = OrderDelivery.find_or_initialize_by(order: @current_order)
    order_delivery.delivery_id = delivery.id

    @current_order.delivery! if @current_order.update(order_delivery: order_delivery)
  end

  def presenter
    
  end
end
