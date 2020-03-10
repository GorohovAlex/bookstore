class ReviewDecorator < ApplicationDecorator
  delegate_all

  def created_at
    object.created_at.strftime('%d/%m/%y')
  end
end
