class Review < ApplicationRecord
  RATING_INTERVAL = (1..5).freeze

  enum status: {
    unprocessed: 0,
    approved: 1,
    rejected: 2
  }

  belongs_to :user
  belongs_to :book
end
