module CartItems
  class SubTotal < AllItems
    def self.call(user_id: nil, session_id: nil)
      super.left_joins(:book).sum('price_cents * quantity / 100').to_money
    end
  end
end
