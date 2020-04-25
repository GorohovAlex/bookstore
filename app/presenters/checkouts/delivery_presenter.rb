module Checkouts
  class DeliveryPresenter < CheckoutBasePresenter
    def delivery_all
      @delivery_all ||= Pundit.policy_scope(user_id, Delivery)
    end
  end
end
