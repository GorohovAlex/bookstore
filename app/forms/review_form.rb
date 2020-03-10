class ReviewForm < BaseForm
  MODEL_CLASS = 'Review'.freeze

  attribute :title, String
  attribute :review, String
  attribute :rating, Integer
  attribute :user_id, Integer
  attribute :book_id, Integer

  TITLE_MAX_LENGTH = 80
  REVIEW_MAX_LENGTH = 500
  REVIEW_TITLE_REGEX = %r{\A[-',a-zA-Z\d\s!#$%&'*+-/=?^_`{|}~]+\z}.freeze

  validates :title, presence: true,
                    format: { with: REVIEW_TITLE_REGEX },
                    length: { maximum: TITLE_MAX_LENGTH }

  validates :review, presence: true,
                     format: { with: REVIEW_TITLE_REGEX },
                     length: { maximum: REVIEW_MAX_LENGTH }

  validates :rating, presence: true

  private

  def persist!
    record.assign_attributes(params)
    record.save
  end

  def params
    {
      title: title,
      review: review,
      rating: rating,
      user_id: user_id,
      book_id: book_id
    }
  end
end
