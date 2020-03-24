require_relative 'base_page'
require_relative 'sections/counter_section'
require_relative 'sections/review_form_section'
require_relative 'sections/reviews_section'

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
  section :review_form,          ReviewFormSection, '#new_review_form'
  section :reviews,              ReviewsSection, '#reviews'
end
