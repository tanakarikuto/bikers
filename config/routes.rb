Rails.application.routes.draw do
  get 'sessions/new'
  root "pages#index"
  
  resources :users
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end

