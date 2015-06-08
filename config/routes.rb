Rails.application.routes.draw do
  get '/' => 'spots#index'
  resources :spots
end