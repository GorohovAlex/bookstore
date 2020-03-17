  class CartItemService
    def initialize(user_id: nil, session_id: nil)
      @user_id = user_id
      @session_id = session_id
    end

    def join_cart_items
      CartItem.where(session_id: @session_id).update(user_id: @user_id)
    end
  end
