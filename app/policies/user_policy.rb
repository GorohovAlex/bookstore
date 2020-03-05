class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def update?
    user.present? && user.id.eql?(record.id)
  end
end
