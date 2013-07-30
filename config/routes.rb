List::Application.routes.draw do
  resources :login
  resources :tasks
  resources :users
  resources :categories
  resources :categories_orders
  root to: "categories#index"
end