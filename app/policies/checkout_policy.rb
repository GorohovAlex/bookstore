class CheckoutPolicy < ApplicationPolicy
  def show?
    user.present?
  end
end
