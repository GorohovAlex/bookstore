class CartItemsController < ApplicationController
  def index
    cookies[:coupon] = params[:coupon] if params[:coupon]
    page_values
  end

  def create
    cart_item_form = CartItemForm.new(cart_item_params)
    cart_item_form.save

    respond_to do |format|
      format.js { render partial: 'partials/header', status: :ok }
    end
  end

  def update
    CartItem.find_by(id: params[:id]).update(quantity: quantity)

    page_values

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  def destroy
    CartItem.delete_by(id: params[:id])
    page_values

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  private

  def quantity
    params[:cart_item][:quantity].to_i.positive? ? params[:cart_item][:quantity] : CartItemForm::DEFAULT_CART_ITEM_COUNT
  end

  def cart_item_params
    params.require(:cart_item).permit(:book_id, :quantity).merge(session_id: session.id.to_s, user_id: current_user&.id)
  end

  def page_values
    @cart_items = CartItems::AllItems.call(user_id: current_user&.id, session_id: session.id.to_s)
    cart_total_values
  end

  def cart_total_values
    discount
    cart_sub_total
    order_total
  end

  def discount
    @discount = Coupons::Discount.call(coupon: coupon).to_money
  end

  def cart_sub_total
    @cart_sub_total = CartItems::SubTotal.call(user_id: current_user&.id, session_id: session.id.to_s)
  end

  def order_total
    @order_total = CartItems::OrderTotal.call(user_id: current_user&.id, session_id: session.id.to_s, coupon: coupon)
  end

  def coupon
    @coupon ||= cookies[:coupon]
  end
end
