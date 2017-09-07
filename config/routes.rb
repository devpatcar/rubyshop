Rails.application.routes.draw do    
  root   'store#index'     
  get    '/signup',  to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy' 
  get    '/admin',   to: 'admin#index'
  post '/signup',  to: 'users#create'
  get    '/store',   to: 'store#index'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  resources :users
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
