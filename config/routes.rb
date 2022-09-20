Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      resources :operations
      resources :coin_wallets
      resources :coins
      resources :wallets
      resources :transitions
      resources :accounts
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        # confirmations:      'devise_token_auth/confirmations',
        # passwords:          'devise_token_auth/passwords',
        # omniauth_callbacks: 'devise_token_auth/omniauth_callbacks',
        registrations:        'api/v1/users/registrations',
        sessions:             'api/v1/users/sessions',
        # token_validations:  'devise_token_auth/token_validations'
      }
    end
  end
  
end
