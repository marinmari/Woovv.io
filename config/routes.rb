# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  
  devise_for :users

  root to: "static_pages#home"
  get '/team', to: 'static_pages#team'
  get '/cgv', to: 'static_pages#cgv'
  get '/help', to: 'static_pages#help'
  resources :coworkings, only: [:index, :show] do
    resources :coworking_pictures, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do 
    resources :avatars, only: [:create, :destroy]
    resources :bookings, only: [:index, :create, :update]
  end 

  namespace :coworking_manager do
    resources :coworkings
    resources :bookings, only: [:index, :update]
  end

  resources :contacts, only:[:create]
end
