module Users
  class UserForm < BaseForm
    MODEL_CLASS = 'User'.freeze

    attribute :user, User

    private

    def record
      self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(id: @id)
    end
  end
end
