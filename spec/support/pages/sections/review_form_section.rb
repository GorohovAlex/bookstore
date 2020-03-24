require_relative 'form_group_input_section'
require_relative 'form_group_text_section'
require_relative 'rating_section'

class ReviewFormSection < SitePrism::Section
  section :title,  FormGroupInputSection, '.title-group'
  section :review, FormGroupTextSection,  '.review-group'
  elements :rating, '#rating > label'
  element :submit, 'input[type="submit"]'
end
