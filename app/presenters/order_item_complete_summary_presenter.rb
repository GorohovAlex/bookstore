class OrderItemCompleteSummaryPresenter < OrderItemSummaryPresenter
  private

  def item_total
    @order.order_items.sum('price_cents * quantity / 100').to_money
  end
end
