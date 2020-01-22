# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
    authors     = Author.create(Array.new(rand(1..2)) { {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name} })
    category    = Category.where(name: Faker::Name.category).first_or_create
    description = Faker::Lorem.paragraph
    title       = Faker::Book.title
    price       = Faker::Number.between(from: 20, to: 120)
    year        = Faker::Number.between(from: 1981, to: 2019)
    # material = Material.where(name: Faker::Construction.material).first_or_create
    Book.create(name: title, authors: authors, price: price, description: description, year_of_publication: year, category_id: category.id)                           
  end
