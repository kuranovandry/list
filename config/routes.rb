List::Application.routes.draw do
  resources :login
  resources :task
  resources :users
  resources :categories
  root to: "categories#index"
end