Rails.application.routes.draw do
  devise_for :users
  get 'user/:id', to: 'users#show', as: :user
  resources :events, only: [:index, :show, :new, :create]
  resources :rsvps, only: [:index, :show, :new, :create]
  
  root to: "events#index"
end
