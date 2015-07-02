Rails.application.routes.draw do
  get '/' => 'spots#index'

  get '/signup' => 'skaters#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :spots
  get '/spots/:id/rate-trick' => 'spots#rate_trick'
  post '/spots/:id/rate-trick' => 'spots#rate_trick'
  
  resources :skaters do
  	resources :tricks
  end

  get '/jams/:jam_id/skaters' => 'jams#join_jam'
  post '/jams/:jam_id/skaters' => 'jams#join_jam'
  resources :jams do
    resources :skaters
  end

  get '/challenges' => 'challenges#index'
  get '/challenges/new' => 'challenges#new'
  post '/challenges' => 'challenges#create'
  post '/challenges/check_attempt' => 'challenges#check_attempt'
  post '/challenges/make_an_attempt' => 'challenges#make_an_attempt'
end