Rails.application.routes.draw do
  resources :books, only: [:show]

  # devise_scope :user do
  #   delete '/user/sign_out' => 'devise/sessions#destroy'
  #   get '/user/log_in' => 'devise/sessions#new'
  # end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'catalog', to: 'page#catalog'
  root 'page#home'
end
