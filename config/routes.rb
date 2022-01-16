Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :tags, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]

end
