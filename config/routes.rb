Rails.application.routes.draw do
  root 'preds#main'

  get "index", to: "preds#index", as: "index"

  resources :preds

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get 'users1', to: "users#index", as: "users1"

  get "signup", to: "users#new", as: "signup"

  get "login", to: "sessions#new", as: "login"
  get "auth", to: "sessions#create", as: "auth"
  get "logout", to: "sessions#destroy", as: "logout"
end

