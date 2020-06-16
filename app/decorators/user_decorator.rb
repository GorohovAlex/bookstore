class UserDecorator < ApplicationDecorator
  delegate_all

  DEFAULT_NAME_LETTER = 'U'.freeze

  def name_first_letter
    object.name&.first || DEFAULT_NAME_LETTER
  end
end
