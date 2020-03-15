module CartItems
  class CartBase
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
