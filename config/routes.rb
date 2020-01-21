Rails.application.routes.draw do
  get 'catalog', to: 'page#catalog'
  get 'home/index'
  
  root 'page#home'
end
