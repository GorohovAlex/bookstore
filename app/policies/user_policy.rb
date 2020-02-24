class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def billing_address?
    user.present?
  end

  def shipping_address?
    user.present?
  end

  def email?
    user.present?
  end

  def password?
    user.present?
  end
end
