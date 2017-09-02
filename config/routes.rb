Rails.application.routes.draw do
 
  resources :users
  root 'store#index'
  
  resources :products
  resources :sessions
  
  get 'sessions/new'
  get '/:admin', to: 'admin#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
