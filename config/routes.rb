Rails.application.routes.draw do
  resources :auth
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :pets
  resources :followings
  resources :posts
  resources :likes
  resources :comments

  post "/sign_in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/search_user", to: "users#search_users"
  get "/petsFollowers/:id", to: "followings#petsFollowers"
  get "/userFollowing/:id", to: "followings#userFollowing"
end
