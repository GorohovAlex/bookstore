module CartItems
  class SubTotal < AllItems
    def self.call(user_id: nil, session_id: nil)
      super.sum('price_cents * quantity / 100.0').to_money
    end
  end
end
