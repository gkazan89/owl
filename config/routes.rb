Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    get "/articles" => "articles#index"
    get "/categories" => "categories#index"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
