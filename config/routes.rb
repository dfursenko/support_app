Rails.application.routes.draw do
  root 'page#index'
  get 'page/about'
end
