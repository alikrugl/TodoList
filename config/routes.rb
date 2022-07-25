# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

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
      get '/:user_id/todos', to: 'todos#index'
    end
    resources :users, only: %i[index show update]
  end

  resources :password_resets, only: [:create] do
    collection do
      get ':token', action: :edit, as: :edit
      patch ':token', action: :update
    end
  end
end
