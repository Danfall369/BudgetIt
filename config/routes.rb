Rails.application.routes.draw do
  get 'splash/index'

  root 'splash#index'

  resources :bills
  resources :services
  resources :users
end
