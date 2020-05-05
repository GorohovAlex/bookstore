class AddressDecorator < ApplicationDecorator
  delegate_all

  def address_info_items
    [
      full_name,
      object.address,
      object.city,
      object.country,
      I18n.t('.phone', number: object.phone)
    ]
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
