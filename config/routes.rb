Rails.application.routes.draw do
  get 'page/home'
  get 'home/index'
  
  root 'page#home'
end
