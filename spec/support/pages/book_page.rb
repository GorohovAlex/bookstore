require_relative 'sections/review_form_section'
require_relative 'sections/reviews_section'

class BookPage < SitePrism::Page
  set_url '/books{/id}'
  element :notice,              '#notice'

  element :name,                '#name'
  element :authors,             '#authors'
  element :price,               '#price'
  element :counter,             '#counter'
  element :description,         '#description'
  element :year_of_publication, '#year_of_publication'
  element :materials,           '#materials'
  section :review_form,          ReviewFormSection, '#new_review_form'
  section :reviews,              ReviewsSection, '#reviews'
end
