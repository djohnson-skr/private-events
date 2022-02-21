Rails.application.routes.draw do
  devise_for :users
  get 'user/:id' => 'user#show'
  resources :events, only: [:index]
  
  root to: "events#index"
end
