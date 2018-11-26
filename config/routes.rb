Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'project', to: 'pages#project'
  # get 'pages(/:page)', to: 'pages#index'
end
