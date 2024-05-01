Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create show index update destroy]
      resources :spots, only: %i[create show index update destroy]
      resources :addresses, only: %i[index]
      resources :videos, only: %i[create show index update destroy] do
        post 'search', on: :collection
      end
      resources :likes, only: %i[index create destroy]
      resources :comments, only: %i[index create update destroy]
      resources :notifications, only: %i[index create update destroy]
      resource :authentication, only: %i[create]

    end
  end

  get '*path', to: 'home#index'
  root to: 'home#index'
end
