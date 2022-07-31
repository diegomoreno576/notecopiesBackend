Rails.application.routes.draw do

  resources :users
  get "/user", to: "users#show_user"
  post "/auth/login", to: "authentication#login"

end