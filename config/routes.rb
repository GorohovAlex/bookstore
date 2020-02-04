Rails.application.routes.draw do
  resources :books, only: [:show]

  get 'catalog', to: 'page#catalog'
  root 'page#home'
end
