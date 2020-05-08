class BestSellersService
  def self.update
    Category.all.each do |category|
      category_book = category_best_seller(category)

      if category_book.present?
        best_seller = BestSeller.find_or_initialize_by(id: category.best_sellers.first&.id)
        best_seller.update(book_id: category_book.id)
      end
    end
  end

  def self.category_best_seller(category)
    category.books.order(order_items_count: :desc).first
  end
end
