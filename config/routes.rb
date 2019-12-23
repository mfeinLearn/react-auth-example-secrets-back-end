Rails.application.routes.draw do
  # post - because I am creating something
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :secrets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
