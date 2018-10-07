Rails.application.routes.draw do
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
  root 'page#index'
  get 'page/about'
end
