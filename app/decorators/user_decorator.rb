class UserDecorator < ApplicationDecorator
  delegate_all

  def name_first_letter
    object.name.first
  end
end
