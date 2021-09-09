# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Nested resources for availabilities, coworkings, bookings, companies to be created in W2

  # root to: "he#index"
  devise_for :users

  root to: "coworkings#index"
  resources :coworkings, only: [:index, :show]
  resources :users, only: [:edit]
end
