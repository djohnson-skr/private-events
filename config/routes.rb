Rails.application.routes.draw do
  devise_for :users
  # get 'user/:id', to: 'users#show', as: :user
  resources :users, only: [:show]
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :rsvps, only: [:index, :show, :new, :create]
  
  root to: "events#index"
end
