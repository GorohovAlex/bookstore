Rails.application.routes.draw do
  resources :books, only: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get   'users/settings',         to: 'users/settings#update',                  as: 'user_settings'
    patch 'users/settings',         to: 'users/settings#update_password',         as: 'update_password'
    patch 'users/billing_address',  to: 'users/settings#update_billing_address',  as: 'users_billing_address_forms'
    patch 'users/shipping_address', to: 'users/settings#update_shipping_address', as: 'users_shipping_address_forms'
    patch 'users/update_email',     to: 'users/settings#update_email',            as: 'update_email'
  end

  get 'catalog', to: 'page#catalog'
  root 'page#home'
end
