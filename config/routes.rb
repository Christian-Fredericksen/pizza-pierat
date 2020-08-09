Rails.application.routes.draw do
  get '/home', to: "application#home", as:"home"
  get '/login', to: "sessions#new", as: "login"
  post '/sessions', to: "sessions#create", as: "sessions"
  delete '/sessions', to: "sessions#destroy"
  
  resources :pizzas do 
    resources :orders, only: [:show]
  end
  resources :customers do 
    resources :pizzas, only: [:new, :show, :index]
  end

  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
