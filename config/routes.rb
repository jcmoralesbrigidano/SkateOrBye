Rails.application.routes.draw do
  get '/' => 'spots#index'
  resources :spots

  get '/spots/:id/rate' => 'tricks#rate'
  resources :skaters do
  	resources :tricks
  end

  get '/signup' => 'skaters#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end