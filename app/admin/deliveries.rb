ActiveAdmin.register Delivery do
  permit_params :name, :days, :price_cents, :price_currency
end
