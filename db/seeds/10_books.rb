1_000.times do
  authors     = Author.order('RANDOM()').limit(rand(1..2))
  category    = Category.order('RANDOM()').first
  description = FFaker::Lorem.paragraph
  title       = FFaker::Book.title.delete(/:/)
  price       = FFaker::Random.rand(20..120)
  year        = FFaker::Random.rand(1981..2019)
  materials   = Material.order('RANDOM()').limit(rand(1..2))
  book_dimension = BookDimension.create(height: rand(5..10.0), width: rand(7..14.0), depth: rand(3..7.0))

  Book.create(name: title,
              authors: authors,
              price: price,
              description: description,
              year_of_publication: year,
              category: category,
              materials: materials,
              book_dimension: book_dimension)
end
