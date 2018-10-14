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

  # resources :users
  # resources :marks
  # resources :tags
  # resources :comments
  # resources :tickets
  # resources :articles
  # resources :categories
  # resources :tickets do
  #   resources :comments, module: :tickets
  # end
  # get 'page/about'
  root 'categories#index'
end
