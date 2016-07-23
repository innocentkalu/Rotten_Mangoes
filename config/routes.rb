Rails.application.routes.draw do

  resources :email_users
  resources :users
  namespace :admin do
  resources :users 
  end

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'movies#index'
end


