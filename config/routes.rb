Rails.application.routes.draw do
  resources :books, only: [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete '/user/sign_out' => 'devise/sessions#destroy'
    get '/user/log_in' => 'devise/sessions#new'
  end

  get 'catalog', to: 'page#catalog'
  # get 'log_in', to: 'page#log_in'
  root 'page#home'
end
