require_relative 'base_page'

class BookPage < BasePage
  set_url '/catalog'

  section :books_items, BookItemSection, '#book-item'
end
