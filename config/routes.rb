Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :users
  resources :likes,       only: [:create, :destroy]
  resources :comments,    only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

end
