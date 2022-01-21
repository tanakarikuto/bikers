Rails.application.routes.draw do
  get 'sessions/new'
  root "pages#index"
  
  resources :users
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get 'users/:id', to: 'users#show'
   get 'users/:id/edit', to: 'users#edit'
   post 'users/:id/update', to: 'users#update'
end

