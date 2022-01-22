Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  resources :spents
  resources :works
  root to: "pages#home"
  get "crew", to: "pages#crew"
  get "treasury", to: "spents#treasury"
  get "map", to: "pages#map"
  get "ship", to: "pages#ship"
  get "notices", to: "pages#notices"
  get "captain", to: "pages#captain"
end
