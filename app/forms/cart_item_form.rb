class CartItemForm < BaseForm
  DEFAULT_CART_ITEM_COUNT = 1

  MODEL_CLASS = 'CartItem'.freeze

  attribute :book_id,    Integer
  attribute :user_id,    Integer
  attribute :session_id, Integer
  attribute :quantity,   Integer, default: DEFAULT_CART_ITEM_COUNT

  validates :book_id,    presence: true
  validates :session_id, presence: true

  private

  def record
    return nil unless self.class::MODEL_CLASS

    @record ||= self.class::MODEL_CLASS.classify.constantize.find_or_initialize_by(record_params)
  end

  def persist!
    params = cart_item_params
    params[:quantity] += record.attributes['quantity'] || 0
    record.assign_attributes(params)
    record.save
  end

  def record_params
    params = {}
    params[:book_id] = book_id

    if user_id.nil?
      params[:session_id] = session_id
    else
      params[:user_id] = user_id
    end

    params
  end

  def cart_item_params
    {
      book_id: book_id,
      user_id: user_id,
      quantity: quantity,
      session_id: session_id
    }
  end
end
