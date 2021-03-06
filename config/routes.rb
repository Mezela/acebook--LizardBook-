Rails.application.routes.draw do

  get 'settings/new'

  get 'home/index'

  get 'likes/getinfo'
  post 'likes/postinfo'

  get 'comment-likes/getinfo'
  post 'comment-likes/postinfo'
  root 'home#index'

  resources :users
  resources :posts
  resources :sessions
  resources :comments
  resources :likes
  resources :comment_likes

  get 'users/:id/detective', to: 'users#detective'


  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

end
