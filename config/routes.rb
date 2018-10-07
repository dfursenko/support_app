Rails.application.routes.draw do
  resources :categories
  root 'page#index'
  get 'page/about'
end
