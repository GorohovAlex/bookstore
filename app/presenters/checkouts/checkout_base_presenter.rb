module Checkouts
  class CheckoutBasePresenter < BasePresenter
    attribute :owner, Object
    attribute :notice, String
    attribute :summary_items, SummaryPresenter

    def initialize(owner: nil, coupon: nil, summary_items: nil)
      super
      @summary_items = CartItemSummaryPresenter.new(user_id: owner.user.id, coupon: coupon)
    end
  end
end
