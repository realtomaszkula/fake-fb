Rails.application.routes.draw do

  resources :users
  resources :friendships, only: [:create, :destroy]

end
