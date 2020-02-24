class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def password?
    user.present?
  end
end
