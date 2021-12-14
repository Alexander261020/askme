Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :tags, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]

=begin   get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new' 
=end
end
