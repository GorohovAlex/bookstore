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
      return scope.find_by!(id: user[:cart_item_id]) if user[:cart_item_id].present?

      user_or_session_scope
    end

    def user_or_session_scope
      scope.where(user[:user].nil? ? { session_id: user[:session_id] } : { user_id: user[:user].id })
    end
  end
end
