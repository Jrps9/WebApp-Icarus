Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'crew', to: 'pages#crew'
  get 'map', to: 'pages#map'
  get 'boat', to: 'pages#boat'
  get 'treasury', to: 'pages#treasury'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
