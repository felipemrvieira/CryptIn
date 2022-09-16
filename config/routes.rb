Rails.application.routes.draw do
  resources :operations
  resources :coin_wallets
  resources :coins
  resources :wallets
  resources :transitions
  resources :accounts
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
