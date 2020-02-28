class FormGroupInputSection < SitePrism::Section
  element :label, 'label'
  element :input, 'input'
  element :error, '.invalid-feedback'
end
