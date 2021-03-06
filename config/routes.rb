Rails.application.routes.draw do
  devise_for :users 

  root to:  "items#index"

  resources :items do
    resources :orders, only: [:new, :create]
  end

  resources :users
  
  patch 'items/edit/:id',to: 'items#update'
end