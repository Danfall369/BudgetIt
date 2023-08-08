Rails.application.routes.draw do

  root 'users#index'

  resources :bills
  resources :services
  resources :users
end
