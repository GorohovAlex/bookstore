30.times do
  authors     = Author.order('RANDOM()').limit(rand(1..2))
  category    = Category.order('RANDOM()').first
  description = Faker::Lorem.paragraph
  title       = Faker::Book.title
  price       = Faker::Number.between(from: 20, to: 120)
  year        = Faker::Number.between(from: 1981, to: 2019)
  # material = Material.where(name: Faker::Construction.material).first_or_create
  Book.create(name: title, authors: authors, price: price, description: description, year_of_publication: year, category_id: category.id)                           
end