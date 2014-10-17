Rails.application.routes.draw do
  resources :users
  resources :cars
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root "cars#index"
end
