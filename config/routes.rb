Rails.application.routes.draw do

  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  devise_for :admins, path: 'admins', controllers: { 
    sessions: "admins/sessions",
    registrations: "admins/registrations", 
  }

  authenticated :admin do
    root 'admins/dashboard#index', as: :authenticated_root
  end

  root 'home_page#index'

  namespace :admins do
    get 'dashboard/index'
    resources :services, except: [:show]
    resources :users, only: [:destroy]
  end

  namespace :users do
    resources :orders, only: [:new, :create, :destroy]
  end

  resources :home_page, only: [:index]
  resources :articles

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
