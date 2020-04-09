class CheckoutPolicy < ApplicationPolicy
  def show?
    user[:user].present?
  end
end
