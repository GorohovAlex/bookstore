module ApplicationHelper
  include Pagy::Frontend

  def cart_item_count
    CartItems::Count.call(session_id: session.id.to_s, user_id: current_user&.id)
  end
end
