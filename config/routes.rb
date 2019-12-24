Rails.application.routes.draw do
  # post - because I am creating something
  # we can call sessions ->  auth

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/get_current_user', to: 'sessions#get_current_user'
  resources :secrets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
