# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  
  # Nested resources for availabilities, coworkings, bookings, companies to be created in W2

  # root to: "he#index"
  devise_for :users

  root to: "static_pages#home"

  get '/team', to: 'static_pages#team'
  resources :coworkings, only: [:index, :show] do
    resources :coworking_pictures, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  namespace :coworking_manager do
    resources :coworkings
  end
end
