Rails.application.routes.draw do
  resources :users
  resources :photos

  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  get "/profile" => "photos#new"
  post "/profile" => "photos#create"
end
