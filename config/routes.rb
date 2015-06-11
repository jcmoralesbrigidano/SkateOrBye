Rails.application.routes.draw do
  get '/' => 'spots#index'
  resources :spots

  post '/spots/:id/rate-trick' => 'spots#rate_trick'
  resources :skaters do
  	resources :tricks
  end

  get '/signup' => 'skaters#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end