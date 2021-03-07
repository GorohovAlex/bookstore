require_relative 'step_section'

class StepsSection < SitePrism::Section
  sections :steps, StepSection, '.step'
  section  :step_active, StepSection, '.active.step'
end
