# frozen_string_literal: true

Rails.application.routes.draw do
  post 'refresh', to: 'refresh#create'
  post 'signin', to: 'sessions#login'
  post 'signup', to: 'users#create'
  get 'logout', to: 'sessions#logout'

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
