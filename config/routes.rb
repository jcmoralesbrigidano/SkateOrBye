Rails.application.routes.draw do
  get '/' => 'spots#index'
  resources :spots

  get '/spots/:id/rate-trick' => 'spots#rate_trick'
  post '/spots/:id/rate-trick' => 'spots#rate_trick'
  resources :skaters do
  	resources :tricks
  end

  get '/spots/:id/new-challenge' => 'challenges#new'
  post '/spots/:id/new-challenge' => 'challenges#create'

  get '/signup' => 'skaters#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end