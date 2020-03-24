10.times do
  authors     = Author.order('RANDOM()').limit(rand(1..2))
  category    = Category.order('RANDOM()').first
  description = FFaker::Lorem.paragraph
  title       = FFaker::Book.title.delete(':')
  price       = rand(20..120)
  year        = rand(1981..2019)
  materials   = Material.order('RANDOM()').limit(rand(1..2))
  book_dimension = BookDimension.create(height: rand(5..10.0), width: rand(7..14.0), depth: rand(3..7.0))

  covers = []
  rand(1..4).times do
    cover = Cover.new
    cover.image_attacher.assign_remote_url(FFaker::Book.orly_cover(title))
    covers << cover
  end

  Book.create(name: title,
              authors: authors,
              price: price,
              description: description,
              year_of_publication: year,
              category: category,
              materials: materials,
              book_dimension: book_dimension,
              covers: covers)
end
