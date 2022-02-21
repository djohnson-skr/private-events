Rails.application.routes.draw do
  devise_for :users
  get 'user/:id' => 'user#show'
  resources :events, only: [:index, :new, :create]
  
  root to: "events#index"
end
