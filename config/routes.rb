Rails.application.routes.draw do
  resources :books, only: [:show]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/user'
  }

  devise_scope :user do
    get   'user',                  to: 'users/user#index',            as: 'user'
    patch 'user/billing_address',  to: 'users/user#billing_address',  as: 'users_billing_address_forms'
    patch 'user/email',            to: 'users/user#email',            as: 'update_user_email'
    patch 'user/password',         to: 'users/user#password',         as: 'update_user_password'
    patch 'user/shipping_address', to: 'users/user#shipping_address', as: 'users_shipping_address_forms'
  end

  get 'catalog', to: 'page#catalog'
  root 'page#home'
end
