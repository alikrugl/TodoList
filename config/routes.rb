# frozen_string_literal: true

Rails.application.routes.draw do
  post 'refresh', to: 'refresh#create'
  post 'signin', to: 'sessions#login'
  post 'signup', to: 'signup#create'
  get 'logout', to: 'sessions#logout'

  get 'user_info', to: 'users#user_info'
  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end

  namespace :admin do
    namespace :users do
      resources :todos, only: [:index]
    end
    resources :users, only: [:index]
  end
end
