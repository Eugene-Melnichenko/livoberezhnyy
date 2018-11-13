Rails.application.routes.draw do

  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :admins, path: 'admins', controllers: { 
    sessions: "admins/sessions",
    registrations: "admins/registrations" 
  }


  root 'home_page#index'

  resources :home_page, only: [:index]
  resources :articles do
    resources :comments
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
