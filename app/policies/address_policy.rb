class AddressPolicy < ApplicationPolicy
  def create?
    user.present? && record.owner_id.eql?(user.id)
  end
end
