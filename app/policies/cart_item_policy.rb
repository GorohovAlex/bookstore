class CartItemPolicy < ApplicationPolicy
  def update?
    record.any?
  end

  def destroy?
    record.any?
  end
end
