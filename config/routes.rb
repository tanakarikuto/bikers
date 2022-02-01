Rails.application.routes.draw do
  get 'sessions/new'
  root "pages#index"
  
 
  get '/signup', to: 'users#new'
  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'
  patch 'users/:id/edit', to: 'users#update'
  
  resources :users
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "/rooms", to: "rooms#show"
  get "/rooms/purpose", to: "rooms#purpose"
  get "/rooms/start_time", to: "rooms#start_time"
  get "/rooms/end_time", to: "rooms#end_time"
  get "/rooms/motorcycle_type", to: "rooms#motorcycle_type"
end

