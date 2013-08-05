List::Application.routes.draw do
  resources :login
  resources :tasks
  resources :users
  resources :categories do
  	collection do
  		get :autocomplete_categories
  	end
  end
  resources :categories_orders
  root to: "categories#index"
end