Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users
  resources :posts

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'project', to: 'pages#project'
  get 'pages(/:page)', to: 'pages#index'

  scope "(:lang)", locale: /ru|en/ do
      root to: 'pages#home'
  end
end
