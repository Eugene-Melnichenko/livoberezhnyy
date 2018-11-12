Rails.application.routes.draw do

  root "home_page#index"

  resources :home_page, only: [:index]
  resources :articles do
    resources :comments
  end
  
end
