require_relative 'base_page'
require_relative 'sections/book_grid_section'

class CatalogPage < BasePage
  set_url '/catalog'
  sections :books_items, BookGridSection, '.book-item'
  element  :button_more, '#next_link'
end
