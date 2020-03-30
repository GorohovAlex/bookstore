module CartItems
  class CartBase
    def self.call(user_id: nil, session_id: nil)
      CartItem.where(cart_items_params(user_id, session_id))
    end

    def self.cart_items_params(user_id, session_id)
      params = {}

      if user_id.nil?
        params[:session_id] = session_id
      else
        params[:user_id] = user_id
      end

      params
    end
  end
end
