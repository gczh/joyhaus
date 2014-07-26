Joyhaus::Application.routes.draw do
  root to: "products#home"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :line_items
  resources :products
  resources :users
  resources :sessions

  resources :carts, path: 'cart' do
    get :empty
    get :checkout, on: :collection
    get :manage, on: :collection
  end

  resources :orders, path: 'order', except: [:index, :edit, :destroy] do
    post :build_review, on: :collection
    get  :review, on: :collection
    resources :order_payments, only: [:create]
  end

  namespace :admin do
    resources :orders, only: [:index, :new, :edit, :update, :destroy]
  end

end
