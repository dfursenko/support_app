Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { 
    registrations: 'users/registrations'
    # sessions: 'users/sessions'
  }
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
