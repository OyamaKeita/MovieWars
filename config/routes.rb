Rails.application.routes.draw do

  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete 'favorites/destroy'
  delete 'topics/destroy'

  resources :users
  resources :topics do
  resources :comments
end
end
