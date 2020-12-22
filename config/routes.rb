Rails.application.routes.draw do
  # get 'sessions/new'
  root 'static_pages#home'
  get "/help", to:"static_pages#help"
  get "/about", to:"static_pages#about"
  get "/contact", to:"static_pages#contact"

  get  "/signup", to:"users#new"
  resources :users

  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"

  resources :account_activations, only: [:edit]

  resources :products, only: [:index, :create, :edit, :show, :update]

  resources :carts
  resources :cart_items

  resources :orders, only: [:index, :create, :show]

  resources :addresses, only: [:index, :create, :show]

  get '/admins/signin', to: 'admins#signin', as: :signin_user
  get '/admins/login', to: 'admins#login', as: :login_user
  get "/resister", to:"products#resister"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
