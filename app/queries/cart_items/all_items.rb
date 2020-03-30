module CartItems
  class AllItems < CartBase
    def self.call(user_id: nil, session_id: nil)
      super.order(:created_at).includes([:book])
    end
  end
end
