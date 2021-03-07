class FormGroupTextSection < SitePrism::Section
  element :label, 'label'
  element :input, 'textarea'
  element :error, '.invalid-feedback'
end
