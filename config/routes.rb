Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  
  # Defines the root path route ("/")
  root "home#index"
end
