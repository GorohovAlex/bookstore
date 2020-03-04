json.extract! review, :id, :title, :review, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
