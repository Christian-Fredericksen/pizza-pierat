Rails.application.routes.draw do
  
  get '/auth/google_oauth2/callback', to: "sessions#create_with_omniauth"
  get '/home', to: "application#home", as:"home"
  get '/login', to: "sessions#new", as: "login"
  post '/sessions', to: "sessions#create", as: "sessions"
  delete '/sessions', to: "sessions#destroy"
  
  resources :pizzas 
  resources :customers do 
    resources :pizzas, only: [:new, :create, :show, :index]
  end
  resources :toppings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
