module Checkouts
  class CheckoutInfoPresenter < CheckoutBasePresenter
    def shipping_address_info_items
      return owner.billing_address.decorate.address_info_items if owner.use_billing_address

      owner.shipping_address.decorate.address_info_items
    end

    def cart_items
      raise NoMethodError
    end
  end
end
