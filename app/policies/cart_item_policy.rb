class CartItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    record.present?
  end

  def destroy?
    update?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(user[:user].nil? ? { session_id: user[:session_id] } : { user_id: user[:user].id })
    end
  end
end
