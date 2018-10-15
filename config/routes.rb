Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
    # sessions: 'users/sessions'
  }

  resources :categories, only: %i[index show] do
    resources :articles, only: :index
  end

  resources :articles, only: :show do
    resources :comments, only: %i[index create destroy], module: :articles
  end

  get '/articles', to: redirect('/categories')

  resources :tickets, except: %i[edit destroy] do
    resources :comments, only: %i[index create destroy], module: :tickets
  end

  resources :users

  resources :comments


  # resources :marks
  # resources :tags
  # resources :tickets
  # resources :articles
  # resources :categories
  # get 'page/about'
  root 'categories#index'
end
