class AccountRemoveForm < SitePrism::Section
  element :remove_checkbox, '.checkbox-icon > i'
  element :submit,          'input[type="submit"]'
end
