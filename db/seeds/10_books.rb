30.times do
  authors     = Author.order('RANDOM()').limit(rand(1..2))
  category    = Category.order('RANDOM()').first
  description = FFaker::Lorem.paragraph
  title       = FFaker::Book.title
  price       = FFaker::Numeric.between(from: 20, to: 120)
  year        = FFaker::Numeric.between(from: 1981, to: 2019)
  # material = Material.where(name: FFaker::Construction.material).first_or_create
  Book.create(name: title,
              authors: authors,
              price: price,
              description: description,
              year_of_publication: year,
              category: category)
end
