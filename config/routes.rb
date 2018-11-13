Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  root "home_page#index"

  resources :home_page, only: [:index]
  resources :articles do
    resources :comments
  end
  
end
