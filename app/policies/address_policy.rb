class AddressPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end
