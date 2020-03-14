module CartItems
  class AllItems < CartBase
    def self.call(user_id: nil, session_id: nil)
      CartItem.where(cart_items_params(user_id, session_id))
    end
  end
end
