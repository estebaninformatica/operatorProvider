Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # OPERATOR
      #Machea primero operators/providers

      
      get 'operators/providers/names' => 'operators#index_with_providers_name'
      get 'operators/providers/limit/:limit/offset/:offset' => 'operators#index_with_providers_name'
      get 'operators/providers/limit/:limit' => 'operators#index_with_providers_name'
      get 'operators/providers/offset/:offset' => 'operators#index_with_providers_name'
      get 'operators/providers' => 'operators#index_with_providers'
      get 'operators/:id/providers' => 'operators#show_with_providers'
      get 'operators/limit/:limit' => 'operators#index'
      get 'operators/offset/:offset' => 'operators#index'
      get 'operators/limit/:limit/offset/:offset' => 'operators#index'

      resources :operators, only: [:index, :show]




      # PROVIDER
      get 'providers/limit/:limit' => 'providers#index'
      get 'providers/offset/:offset' => 'providers#index'
      get 'providers/limit/:limit/offset/:offset' => 'providers#index'
      get 'providers/:id/operator' => 'providers#show_with_operator'
      resources :providers, only: [:index, :show]

    end
  end

end
