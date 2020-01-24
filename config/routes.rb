Rails.application.routes.draw do
  get 'catalog', to: 'page#catalog'
  root to: 'page#home'
end
