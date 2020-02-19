class BaseForm
  include Virtus.model
  include ActiveModel::Model

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

  def persist!; end
end
