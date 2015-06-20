Rails.application.routes.draw do
  get '/' => 'home#index'
  
  resources :spots
  get '/spots/:id/rate-trick' => 'spots#rate_trick'
  post '/spots/:id/rate-trick' => 'spots#rate_trick'
  
  resources :skaters do
  	resources :tricks
  end

  get '/challenges/new' => 'challenges#new'
  post '/challenges' => 'challenges#create'
  get '/challenges' => 'skater_challenges#index'

  get '/signup' => 'skaters#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end