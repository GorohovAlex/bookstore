module Books
  class LastestBooks
    DEAFULT_QUANTITY = 3

    def self.call(relation: Book.all, quantity: DEAFULT_QUANTITY)
      relation.last(quantity)
    end
  end
end
