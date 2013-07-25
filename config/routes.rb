List::Application.routes.draw do
  resources :users
  resources :categories
  root to: "users#index"
end