Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    get "/articles" => "articles#index"
    get "/read" => "articles#read"
    get "/test" => "articles#test"
    get "/view" => "articles#view"
    get "/pic" => "articles#pic"

    get "/categories" => "categories#index"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    post "/histories/test" => "histories#test"
    get "/histories" => "histories#index"
    post "/histories" => "histories#create"

    get "/preferences" => "preferences#index"
    post "/preferences" => "preferences#create"
    patch "/preferences/:id" => "preferences#update"
  end
end
