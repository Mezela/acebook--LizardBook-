Rails.application.routes.draw do



  get 'settings/new'

  get 'home/index'
  root 'home#index'

  resources :users
  resources :posts
  resources :sessions
  resources :comments
  resources :likes
  resources :comment_likes



  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  map.resources :statuses,   :path_prefix => '/:user_id'
  map.resources :users,     :except => [:show]
  map.user '/:username', :controller => 'users', :action => 'show'

end
