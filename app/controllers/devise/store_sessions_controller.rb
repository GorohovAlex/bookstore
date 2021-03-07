module Devise
  class StoreSessionsController < Devise::SessionsController
    def create
      CartItemService.new(user_id: current_user&.id, session_id: session.id.to_s).join_cart_items
      super
    end
  end
end
