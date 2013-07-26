List::Application.routes.draw do
  resources :login
  resources :tasks
  resources :users
  resources :categories
  root to: "categories#index"
end