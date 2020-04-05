  class CheckoutBaseService
    def initialize(current_order:, params: [])
      @current_order = current_order
      @params = params
    end

    def call
      raise NoMethodError
    end

    def presenter
      raise NoMethodError
    end
  end
