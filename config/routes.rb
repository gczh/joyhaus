Joyhaus::Application.routes.draw do

  resources :line_items

  resources :carts

  resources :orders

  resources :products

  root to: "products#home"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
end
