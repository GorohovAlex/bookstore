class ConfirmationService < CheckoutBaseService
  def call
    return edit_action if edit_params?

    ActiveRecord::Base.transaction do
      create_order_items
      create_summary
      create_number
      delete_cart_items
      change_coupon if @coupon.present?
    end

    current_order.complete!
  end

  def presenter
    @presenter ||= Checkouts::ConfirmationPresenter.new(owner: current_order)
  end

  private

  def create_order_items
    cart_items.each do |item|
      OrderItem.create(order: current_order, book: item.book, name: item.book.name, quantity: item.quantity,
                       price: item.book.price, total: item.book.price * item.quantity)
    end
  end

  def cart_items
    @cart_items ||= CartItems::AllItems.call(user_id: current_order.user.id)
  end

  def delete_cart_items
    cart_items.destroy_all
  end

  def create_summary
    presenter.summary_items.each do |item|
      OrderSummary.create(order: current_order, item_name: item[0], price: item[1])
    end
  end

  def create_number
    current_order.update(number: current_order.decorate.order_number)
  end

  def change_coupon
    @coupon.update(count: @coupon.count - 1)
  end

  def edit_action
    case edit_params[:state].to_sym
    when Order::STATE_ADDRESS then current_order.sending!
    when Order::STATE_DELIVERY then current_order.deliver!
    when Order::STATE_PAYMENT then current_order.pay!
    end
  end

  def edit_params
    @params.require(:edit).permit(:state) if edit_params?
  end

  def edit_params?
    @params[:edit].present?
  end
end
