Rails.application.routes.draw do
  get '/' => 'spots#index'
  resources :spots
  get '/signup' => 'skaters#new'
  resources :skaters
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end