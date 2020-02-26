class BaseForm
  include Virtus.model
  include ActiveModel::Model

  attribute :id, Integer

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def record; end

  def persist!; end
end
