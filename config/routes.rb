# frozen_string_literal: true

Rails.application.routes.draw do
  post 'refresh', to: 'refresh#create'
  post 'signin', to: 'sessions#create'
  post 'signup', to: 'users#create'
  delete 'signin', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
