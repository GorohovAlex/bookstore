module Books
  class BestSellers
    DEAFULT_QUANTITY = 4

    def self.call(relation: Book.includes(:authors), quantity: DEAFULT_QUANTITY)
      relation.joins(:order_items).group(:id).order('count(books.id) desc').limit(quantity)
    end
  end
end
