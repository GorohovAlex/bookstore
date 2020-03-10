require_relative 'form_group_input_section'

class ReviewsSection < SitePrism::Section
  element  :reviews_count, '#reviews_count'
  elements :review_list,   '#reviews_list > div'
end
