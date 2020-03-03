Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: [:show]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'devise/user'
  }

  devise_scope :user do
    get   'user',          to: 'devise/user#edit',     as: 'user'
    patch 'user/password', to: 'devise/user#update',   as: 'update_user_password'
    patch 'user/email',    to: 'devise/user#update',   as: 'update_user_email'
    patch 'user/address',  to: 'address#create', as: 'user_address_forms'
  end

  get 'catalog', to: 'page#catalog'
  root 'page#home'
end
