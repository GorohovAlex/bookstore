class BaseForm
  include Virtus.model
  include ActiveModel::Model

  attribute :id, Integer

  def save
    persist! if valid?
  end

  def record
    return nil unless self.class::MODEL_CLASS

    @record ||= self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(record_params)
  end

  private

  def record_params
    { id: @id }
  end

  def persist!
    raise NoMethodError
  end
end
