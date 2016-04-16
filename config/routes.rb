Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users do
    member do
      get 'friends'
    end
  end

  resources :posts

  post 'likes',   to: 'likes#create'
  delete 'likes', to: 'likes#destroy'
  resources :comments,    only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

end
