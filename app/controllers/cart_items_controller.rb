class CartItemsController < ApplicationController
  def index
    authorize cart_items

    cart_values
  end

  def create
    authorize CartItem

    respond_to do |format|
      if cart_item_service.create(cart_item_params)
        format.js { render partial: 'partials/header', status: :ok }
      else
        format.js do
          render partial: 'partials/header', status: :unprocessable_entity, notice: t('unprocessable_entity')
        end
      end
    end
  end

  def update
    authorize cart_item

    cart_item_service.update_quantity(cart_item, quantity)

    respond_to do |format|
      format.js { redirect_to cart_items_path, turbolink: true }
    end
  end

  def destroy
    authorize cart_item

    respond_to do |format|
      if cart_item_service.delete(cart_item)
        format.js { redirect_to cart_items_path, turbolink: true }
      else
        format.js { render :destroy, status: :unprocessable_entity, notice: t('unprocessable_entity') }
      end
    end
  end

  private

  def cart_items
    @cart_items ||= policy_scope(CartItem)
  end

  def cart_item
    @cart_item ||= CartItem.find_by!(id: params[:id]) if params[:id].present?
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
                                               coupon_name: cookies[:coupon])
  end

  def quantity
    item = params[:cart_item]
    return CartItemForm::DEFAULT_CART_ITEM_COUNT unless item.present? && item[:quantity].to_i.positive?

    params[:cart_item][:quantity]
  end

  def cart_values
    cookies[:coupon] = params[:coupon] if params[:coupon]
    @coupon = cookies[:coupon]
    @cart_items = policy_scope(CartItem)
    @summary_presenter = CartItemSummaryPresenter.new(user_id: current_user&.id, session_id: session.id.to_s,
                                                      coupon_name: @coupon)
  end
end
