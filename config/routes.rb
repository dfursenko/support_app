Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :marks
  resources :tags
  resources :comments
  resources :tickets
  resources :articles
  resources :categories
  resources :articles do
    resources :comments, module: :articles
  end
  resources :tickets do
    resources :comments, module: :tickets
  end
  root 'articles#index'
  get 'page/about'
end
