class CartItemDecorator < ApplicationDecorator
  delegate_all

  def sub_total
    object.quantity * object.book.price
  end
end
