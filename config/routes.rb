# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "borrowing_things#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: [:index]
  resources :borrowing_things, except: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
