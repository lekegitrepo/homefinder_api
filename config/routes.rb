Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sign_up', to: 'users#create'

      resources :users, only: [:show, :update, :destroy]
    end
  end
 end
