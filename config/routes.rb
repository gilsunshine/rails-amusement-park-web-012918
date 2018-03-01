Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :attractions
  resources :sessions
  resources :rides
  post '/signout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/rides', to: 'attractions#show'
end
