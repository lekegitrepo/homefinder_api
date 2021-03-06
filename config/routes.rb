Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sign_up', to: 'users#create'
      post 'sign_in', to: 'sessions#create'
      delete 'log_out', to: 'sessions#destroy'
      delete 'remove_fav', to: 'favourites#destroy'

      resources :users, only: [:show, :update, :destroy]
      resources :homes, only: [:show, :index]
      resources :favourites, only: [:index, :create, :destroy]
    end
  end
 end
