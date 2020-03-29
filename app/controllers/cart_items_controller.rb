class CartItemsController < ApplicationController
  before_action :authorize_resource

  def index
    cookies[:coupon] = params[:coupon] if params[:coupon]
    @cart_items = policy_scope(CartItem)
    cart_total_values
  end

  def create
    cart_item_form = CartItemForm.new(cart_item_params)
    cart_item_form.save
    respond_to do |format|
      format.js { render partial: 'partials/header', status: :ok }
    end
  end

  def update
    @cart_item.update(quantity: quantity)

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  def destroy
    CartItem.delete(@cart_item)

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  private

  def authorize_resource
    @cart_item = policy_scope(CartItem)
    @cart_item = @cart_item.where(id: params[:id]) unless params[:id].nil?
    authorize @cart_item
  end

  def pundit_user
    { user: current_user, session_id: session.id.to_s }
  end

  def quantity
    params[:cart_item][:quantity].to_i.positive? ? params[:cart_item][:quantity] : CartItemForm::DEFAULT_CART_ITEM_COUNT
  end

  def cart_item_params
    params.require(:cart_item).permit(:book_id, :quantity)
          .merge(session_id: session.id.to_s, user_id: current_user&.id)
  end

  def cart_total_values
    cart_item_service = CartItemService.new(user_id: current_user&.id, session_id: session.id.to_s,
                                            coupon: cookies[:coupon])

    @cart_sub_total = cart_item_service.cart_sub_total
    @discount = cart_item_service.discount.to_money
    @order_total = cart_item_service.order_total
  end
end
