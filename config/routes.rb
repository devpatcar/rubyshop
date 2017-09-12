Rails.application.routes.draw do     
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'

  resources :products do
    get :who_bought, on: :member
  end

  get    '/signup',  to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy' 
  get    '/admin',   to: 'admin#index'
  post '/signup',  to: 'users#create'
  get    '/store',   to: 'store#index'

  resources :users
  resources :products  
end
