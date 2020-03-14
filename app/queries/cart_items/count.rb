module CartItems
  class Count < AllItems
    def self.call(user_id: nil, session_id: nil)
      super.sum(:quantity)
    end
  end
end
