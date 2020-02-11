module Books
  class BestSellers
    DEAFULT_QUANTITY = 4

    def self.call(relation: Book.includes([:authors]), quantity: DEAFULT_QUANTITY)
      relation.order(price_cents: :desc).limit(quantity)
    end
  end
end
