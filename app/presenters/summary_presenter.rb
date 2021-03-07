class SummaryPresenter < Rectify::Presenter
  def summary
    []
  end

  private

  def item_total
    raise NoMethodError
  end

  def discount
    raise NoMethodError
  end

  def order_total
    raise NoMethodError
  end
end
