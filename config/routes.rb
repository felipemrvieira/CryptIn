Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      resources :operations
      resources :coin_wallets
      resources :coins
      resources :wallets
      resources :transitions
      resources :accounts
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  
end
