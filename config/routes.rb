Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :users
  resources :posts
  resources :likes,       only: [:create, :destroy]
  resources :comments,    only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

end
