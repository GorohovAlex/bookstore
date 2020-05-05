module Checkouts
  class CheckoutBasePresenter < BasePresenter
    attribute :owner, Object
    attribute :notice, String
    attribute :user_id, Integer
    attribute :coupon_name, String

    def summary_items
      @summary_items ||= OrderItemSummaryPresenter.new(order: owner, coupon: @coupon_name).items
    end
  end
end
