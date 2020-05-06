class BestSellersService
  def self.update
    Category.all.map do |category|
      best_seller = BestSeller.find_or_initialize_by(category_id: category.id)
      category_book = category_best_seller(category)
      best_seller.update(book_id: category_book.id) unless category_book.nil?
    end
  end

  def self.category_best_seller(category)
    category.books.order(order_items_count: :desc).first
  end
end
