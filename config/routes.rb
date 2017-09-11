Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'base#index'

  resources :users, except: [:index] do
    resources :ideas
  end

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :images
    resources :ideas, only: [:index, :show]
    resources :categories
  end


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "admin/base#dashboard"
  get "/", to: "base#index"
end
