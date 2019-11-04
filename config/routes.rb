Rails.application.routes.draw do
  get 'home/index'

  resources :users
  resources :posts

  root 'home#index'
end
