Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :movements
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'users#home'
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  root 'users#home'
end
