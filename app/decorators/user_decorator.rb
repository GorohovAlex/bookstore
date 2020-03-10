class UserDecorator < ApplicationDecorator
  delegate_all

  def name_first_letter
    object.name[0, 1]
  end
end
