module Books
  class LastestBooks
    DEAFULT_QUANTITY = 3

    def self.call(relation: Book.all, quantity: DEAFULT_QUANTITY)
      relation.order(id: :desc).limit(quantity)
    end
  end
end
