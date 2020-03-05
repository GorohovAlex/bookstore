class ReviewForm < BaseForm
  attribute :title, String
  attribute :review, String
  attribute :rating, Integer
  attribute :user_id, Integer
  attribute :book_id, Integer

  TITLE_MAX_LENGTH = 80
  REVIEW_MAX_LENGTH = 500
  REVIEW_TITLE_REGEX = /\A[-',a-zA-Z\d\s!#$%&'*+-\/=?^_`{|}~]+\z/

  validates :title, presence: true,
                    format: { with: REVIEW_TITLE_REGEX },
                    length: { maximum: TITLE_MAX_LENGTH }
  
  validates :review, presence: true,
                     format: { with: REVIEW_TITLE_REGEX },
                     length: { maximum: REVIEW_MAX_LENGTH }
  
  validates :rating, presence: true

  private

  def persist!
    Review.create(params)
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
