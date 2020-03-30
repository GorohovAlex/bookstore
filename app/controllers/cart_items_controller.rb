class CartItemsController < ApplicationController
  before_action :authorize_resource

  def index
    cookies[:coupon] = params[:coupon] if params[:coupon]
    @cart_items = policy_scope(CartItem)
    cart_total_values
  end

  def create
    respond_to do |format|
      if cart_item_service.create(cart_item_params)
        format.js { render partial: 'partials/header', status: :ok }
      else
        format.js { render partial: 'partials/header', status: :unprocessable_entity, notice: 'Error' }
      end
    end
  end

  def update
    cart_item_service.update_quantity(@cart_item&.id, quantity)

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  def destroy
    respond_to do |format|
      if cart_item_service.delete(@cart_item&.id)
        format.js { redirect_to cart_items_path, turbolink: true }
      else
        format.js { render :destroy, status: :unprocessable_entity, notice: 'Error' }
      end
    end
  end

  private

  def authorize_resource
    @cart_item = policy_scope(CartItem)
    @cart_item = @cart_item.find_by!(id: params[:id]) unless params[:id].nil?
    authorize @cart_item
  end

  def pundit_user
    { user: current_user, session_id: session.id.to_s }
  end

  def cart_item_params
    params.require(:cart_item).permit(:book_id, :quantity)
          .merge(session_id: session.id.to_s, user_id: current_user&.id)
  end

  def cart_item_service
    @cart_item_service ||= CartItemService.new(user_id: current_user&.id, session_id: session.id.to_s,
                                               coupon: cookies[:coupon])
  end

  def quantity
    item = params[:cart_item]
    return CartItemForm::DEFAULT_CART_ITEM_COUNT unless item.present? && item[:quantity].to_i.positive?

    params[:cart_item][:quantity]
  end

  def cart_total_values
    @cart_sub_total = cart_item_service.cart_sub_total
    @discount = cart_item_service.discount.to_money
    @order_total = cart_item_service.order_total
  end
end
