Rails.application.routes.draw do
  devise_for :users 

  root to:  "items#index"
  resources :items 
  resources :users
  resources :orders
  patch 'items/edit/:id',to: 'items#update'
end