100.times do

  email    = FFaker::Internet.email
  password = FFaker::Internet.password
  name     = FFaker::Name.name
  image    = FFaker::Avatar.image if rand(2)

  User.create(email: email, name: name, password: password, password_confirmation: password, image: image)
end
