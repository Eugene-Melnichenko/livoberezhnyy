Rails.application.routes.draw do

  root 'home_page#index'

  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :admins, path: 'admins', controllers: { 
    sessions: "admins/sessions",
    registrations: "admins/registrations" 
  }

  namespace :admins do
    resources :users
  end


  resources :home_page, only: [:index]
  resources :articles do
    resources :comments
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
