class BookDecorator < ApplicationDecorator
  delegate_all

  DEFAULT_COVER_URL = 'https://www.bramstein.com/static/smashing-book-5-photo-stack.9d5d114e3e.jpg'

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
    object.description[0...Book::DESCRIPTION_SHORT_LENGTH]
  end

  def description_end
    object.description[Book::DESCRIPTION_SHORT_LENGTH...object.description.size]
  end

  def main_cover_url
    object.covers&.first&.image_url(:large) || DEFAULT_COVER_URL
  end

  def secondary_covers
    object.covers&.drop(1)
  end
end
