require_relative 'base_page'
require_relative 'sections/steps_section'

class CheckoutBasePage < BasePage
  set_url '/checkout'

  section :steps,  StepsSection, '.steps.list-inline'
  element :button, '.btn'
end
