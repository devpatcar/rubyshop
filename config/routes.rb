Rails.application.routes.draw do   
  root   'store#index'    
  get    '/signup',  to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy' 
  get    '/admin',   to: 'admin#index'
  post '/signup',  to: 'users#create'

  resources :users
  resources :products
end
