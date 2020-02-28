class BaseForm
  include Virtus.model
  include ActiveModel::Model

  attribute :id, Integer

  def persisted?
    false
  end

  def save
    persist! if valid?
  end

  private

  def record
    return nil unless self.class::MODEL_CLASS

    self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(id: @id)
  end

  def persist!; end
end
