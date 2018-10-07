Rails.application.routes.draw do
  resources :tickets
  resources :articles
  resources :categories
  root 'page#index'
  get 'page/about'
end
