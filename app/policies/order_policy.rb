class OrderPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def create?
    show?
  end

  def update?
    show?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(user: user)
    end
  end
end
