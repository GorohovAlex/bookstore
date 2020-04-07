class ConfirmService < CheckoutBaseService
  def call
    return edit_action if edit_params?

    ActiveRecord::Base.transaction do
      create_order_items
      delete_cart_items
      create_summary
      create_number
      change_coupon if @coupon.present?
    end

    @current_order.to_complete!
  end

  def presenter
    ConfirmPresenter.new(owner: @current_order)
  end

  private

  def create_order_items
    cart_items = CartItems::AllItems.call(user_id: @current_order.user.id)
    cart_items.each do |item|
      OrderItem.create(order: @current_order, book: item.book, quantity: item.quantity, price: item.book.price)
    end
  end

  def delete_cart_items
    cart_items = CartItems::AllItems.call(user_id: @current_order.user.id)
    CartItem.destroy(cart_items.map(&:id))
  end

  def create_summary
    cart_summary_items = CartItemSummaryPresenter.new(user_id: nil, coupon: @params[:coupon]).summary

    cart_summary_items.each do |item|
      OrderSummary.create(order: @current_order, item_name: item[0], price: item[1])
    end
  end

  def create_number
    Order.update(number: @current_order.decorate.order_number)
  end

  def change_coupon
    @coupon.update(count: @coupon.count - 1)
  end

  def edit_action
    case edit_params[:state].to_sym
    when :address then @current_order.to_address!
    when :delivery then @current_order.to_delivery!
    when :payment then @current_order.to_payment!
    end
  end

  def edit_params
    @params.require(:edit).permit(:state) if edit_params?
  end

  def edit_params?
    @params[:edit].present?
  end
end
