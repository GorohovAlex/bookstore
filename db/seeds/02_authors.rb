30.times do
  Author.create({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name })
end