Rails.application.routes.draw do
  root   'menus#index'
  get    '/show',    to: 'menus#show'
  get    '/confirm', to: 'menus#confirm'
  get    '/history', to: 'menus#history'
  get    '/check',   to: 'menus#check'
  get    '/new',     to: 'menus#new'
  post   '/menus',   to: 'menus#create'
  delete '/menus',   to: 'menus#destroy'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
