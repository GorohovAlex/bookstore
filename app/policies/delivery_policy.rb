class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.all
    end
  end
end
