100.times do |index|
  user = User.order('RANDOM()').first
  number = "S#{index.to_s.rjust(6, '0')}"
  order = Order.create(user: user, aasm_state: :completed, number: number)

  rand(1..10).times do
    book = Book.order('RANDOM()').first
    count = rand(1..5)
    order.order_items.create(book: book, quantity: count, price: book.price, total: count * book.price)
  end
end
