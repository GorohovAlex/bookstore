class OrderPolicy < ApplicationPolicy
  def show?
    user[:user].present?
  end
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(user: user)
    end
  end
end
