class BookDecorator < Draper::Decorator
  delegate_all

  def authors_show
    object.authors.collect { |author| "#{author.last_name} #{author.first_name}" }.join(', ')
  end

  def materials_show
    object.materials.collect(&:name).join(', ')
  end

  def price_show
    h.humanized_money_with_symbol object.price
  end

  def description_begin
    object.description[0...200]
  end

  def description_end
    object.description[200...object.description.size]
  end
end
