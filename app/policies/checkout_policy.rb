class CheckoutPolicy < ApplicationPolicy
  def show?
    user.present? # && record.user_id.eql?(user.id)
  end
end
