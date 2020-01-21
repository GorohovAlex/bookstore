# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


authors = Author.create([{name: 'Dane Hillard'}])
Book.create(name: 'Practices of the Python Pro (2020)', authors: authors, description: 'Разработчики-профессионалы знают о преимуществах написания хорошо организованного и читабельного кода. Изучая и следуя приведённым в книге советам и шаблонам, вы научитесь проектировать чистое, легко поддерживаемое программное обеспечение, используя Python. Книга подойдет всем, кто собирается начать изучение этого языка программирования.')

