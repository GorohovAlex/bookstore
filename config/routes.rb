Rails.application.routes.draw do
  get 'books/:id', to: 'books#show', as: :book
  get 'catalog', to: 'page#catalog'

  root to: 'page#home'
end
