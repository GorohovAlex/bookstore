class PagePolicy < ApplicationPolicy
  def checkout_email_login?
    !user.present?
  end
end
