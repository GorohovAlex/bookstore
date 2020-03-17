require_relative 'base_page'
require_relative 'sections/counter_section'

class BookPage < BasePage
  set_url '/books{/id}'

  element :name,                '#name'
  element :authors,             '#authors'
  element :price,               '#price'
  section :counter,             CounterSection, '#counter'
  element :button_add_to_cart,  '#button_add_to_cart'
  element :description,         '#description'
  element :year_of_publication, '#year_of_publication'
  element :materials,           '#materials'
end
