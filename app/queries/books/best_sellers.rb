module Books
  class BestSellers
    DEAFULT_QUANTITY = 4

    def self.call(relation: Book.includes(:authors), quantity: DEAFULT_QUANTITY)
      relation.joins(:best_seller).limit(quantity)
    end
  end
end
