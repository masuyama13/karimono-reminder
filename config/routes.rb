# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "borrowing_things#index"
  resources :borrowing_things
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
