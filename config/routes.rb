Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :orders
  resources :pizzas
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
