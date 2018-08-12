Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    get "/articles" => "articles#index"
    get "/categories" => "categories#index"
    get "/read" => "articles#read"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/histories" => "histories#index"
    post "/histories" => "histories#create"

    get "/preferences" => "preferences#index"

    post "/preferences" => "preferences#create"

    patch "/preferences/:id" => "preferences#update"
  end
end
