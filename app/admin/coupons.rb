ActiveAdmin.register Coupon do
  permit_params :name, :count, :discount, :enabled
end
