Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :books
  resources :homes
  resources :users
end
