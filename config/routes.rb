Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get '/health', to: 'health#health'
      get '/health/videos', to: 'health#index'
      get '/health/videos/:slug', to: 'health#show', param: :slug
      resources :videos, except: [:show, :update, :destroy]
      get '/videos/:slug', to: 'videos#show', param: :slug
      put '/videos/:slug', to: 'videos#update', param: :slug
      delete '/videos/:slug', to: 'videos#destroy', param: :slug
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
