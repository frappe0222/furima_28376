Rails.application.routes.draw do
  devise_for :users 

  root to:  "items#index"
  resources :items 
  resources :users
  patch 'items/edit/:id',to: 'items#update'
end