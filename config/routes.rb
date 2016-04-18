Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users do
    member do
      get 'friends'
    end
  end

  resources :friendships, only: [:create, :destroy]

  resources :posts do
    resources :likes, only:  [:create, :destroy]
  end


  resources :comments, only: [:create, :destroy]


end
