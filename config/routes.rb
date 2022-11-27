Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  post "/login", to: "users#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
