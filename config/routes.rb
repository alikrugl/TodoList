# frozen_string_literal: true

Rails.application.routes.draw do
  post 'refresh', to: 'refresh#create'
  post 'signin', to: 'signin#create'
  post 'signup', to: 'signup#create'
  delete 'signin', to: 'signin#destroy'

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
