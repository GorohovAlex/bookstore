Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cart_items, path: 'cart'
  resource :checkout

  resources :books, only: [:show] do
    resources :reviews, only: [:create]
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'devise/user',
    sessions: 'devise/store_sessions'
  }

  devise_scope :user do
    get   'user',          to: 'devise/user#edit',   as: 'user'
    patch 'user/password', to: 'devise/user#update', as: 'update_user_password'
    patch 'user/email',    to: 'devise/user#update', as: 'update_user_email'
    patch 'user/address',  to: 'address#create',     as: 'user_address_forms'
    get   'user/orders',   to: 'orders#index',       as: 'user_orders'
    get   'user/orders/:id', to: 'orders#show', as: 'user_order'
  end

  get 'catalog', to: 'page#catalog'
  get 'checkout_email_login', to: 'page#checkout_email_login'
  root 'page#home'
end
