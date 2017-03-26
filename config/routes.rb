Rails.application.routes.draw do
  root 'restaurants#index'
  resource :restaurant, only: [:index, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
