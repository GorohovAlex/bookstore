class AddressPolicy < ApplicationPolicy
  def create?
    # user.present? && record.user_id.eql?(user.id)
    true
  end
end
