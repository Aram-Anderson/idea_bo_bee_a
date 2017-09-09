Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  resources :users, except: [:index] do
    resources :ideas
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :images
    resources :ideas, only: [:index]
  end


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "admin/base#dashboard"
end
