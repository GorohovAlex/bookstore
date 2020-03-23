class CheckoutPolicy < ApplicationPolicy
  def new?
    user.present?
  end
end
