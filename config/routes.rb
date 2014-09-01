Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # OPERATOR
      resources :operators, only: [:index, :show]
      get 'operators/providers' => 'operators#index_with_providers'
      get 'operators/:id/providers' => 'operators#show_with_providers'
      get 'operators/limit/:limit' => 'operators#index'
      get 'operators/offset/:offset' => 'operators#index'
      get 'operators/limit/:limit/offset/:offset' => 'operators#index'
      # PROVIDER
      resources :providers, only: [:index, :show]
      get 'providers/limit/:limit' => 'providers#index'
      get 'providers/offset/:offset' => 'providers#index'
      get 'providers/limit/:limit/offset/:offset' => 'providers#index'
      get 'providers/:id/operator' => 'providers#show_with_operator'

    end
  end

end
