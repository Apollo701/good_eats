Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  get 'login' => 'user_sessions#new', as: :login
  # get 'logout' => 'user_sessions#destroy', as: :logout
end
