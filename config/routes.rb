Rails.application.routes.draw do
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # root to: "he#index"
  devise_for :users
  
  root to: "coworkings#index"
  resources :coworkings
  
end
