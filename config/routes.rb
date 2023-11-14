Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "prototypes#index"

  resources :users, only: [:edit, :updat, :show]

  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
     resources :comments, only: [:create]

  
  end
end
