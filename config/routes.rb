Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  resources :users
  resources :tasks
  root 'users#index'
  resources :tasks do
  member do
    patch 'update_status', to: 'tasks#update_status'
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
