class CartItemsController < ApplicationController
  def show
    @cart_items = CartItems::AllItems.call(user_id: current_user&.id, session_id: session.id.to_s)
    @cart_sub_total = CartItems::SubTotal.call(user_id: current_user&.id, session_id: session.id.to_s)
  end

  def create
    cart_item_form = CartItemForm.new(cart_item_params)
    cart_item_form.save
    respond_to do |format|
        # format.html { redirect_to user_path, flash: { notice: t('.successful_message', type: @address_form.type) } }
        format.js { render partial: 'partials/header', status: :unprocessable_entity }
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:book_id, :quantity).merge(session_id: session.id.to_s, user_id: current_user&.id)
  end
end
