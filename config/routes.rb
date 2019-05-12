Rails.application.routes.draw do
  
      root 'shortens#index'
      get 's/:name', to:'shortens#s'
      get 'data', to:'shortens#data'
      post 'authenticate', to: 'authentication#authenticate'
      resources :shortens do
        resources :hitlogs
      end
  namespace :api do
    namespace :v1 do
      resources :shortens  
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
