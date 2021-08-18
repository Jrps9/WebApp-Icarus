Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  root to: 'pages#home'
  get 'crew', to: 'pages#crew'
  get 'map', to: 'pages#map'
  get 'ship', to: 'pages#ship'
  get 'treasury', to: 'pages#treasury'
  get 'notices', to: 'pages#notices'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
