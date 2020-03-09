class FormGroupSelectSection < SitePrism::Section
  element :label,  'label'
  element :select, 'select'
  element :error,  '.invalid-feedback'
end
