Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :pets
  resources :followings
  resources :posts
  resources :likes
  resources :comments
  resources :auth

  post "/sign_in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/search_user", to: "users#search_users"
  get "/petsFollowers/:id", to: "followings#petsFollowers"
  get "/userFollowing/:id", to: "followings#userFollowing"
  get "/signout/:id", to: "users#signout"
  get "/userUpdates/:id", to: "users#userUpdates"
  get "/randomPosts", to: "posts#randomPosts"
end
