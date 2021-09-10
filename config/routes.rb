# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  
  # Nested resources for availabilities, coworkings, bookings, companies to be created in W2

  # root to: "he#index"
  devise_for :users

  root to: "static_pages#home"
  resources :coworkings, only: [:index, :show]
  resources :users, only: [:show]
end
