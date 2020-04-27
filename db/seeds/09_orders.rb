100.times do
  user = User.order('RANDOM()').first
  order = Order.create(user: user, aasm_state: :completed)

  rand(1..10).times do
    book = Book.order('RANDOM()').first
    count = rand(1..5)
    order.order_items.create(book: book, quantity: count, price: book.price, total: count * book.price)
  end
end
