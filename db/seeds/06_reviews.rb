300.times do
  title  = FFaker::Lorem.phrase
  review = FFaker::Lorem.sentence
  rating = rand(1..5)
  status = rand(0..2)
  book   = Book.order('RANDOM()').first
  user   = User.order('RANDOM()').first

  Review.create(
    title: title,
    review: review,
    rating: rating,
    status: status,
    book: book,
    user: user
  )
end
