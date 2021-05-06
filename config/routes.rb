Rails.application.routes.draw do
  root   'menus#index'
  get    '/show/:id',    to: 'menus#show', as: 'show'
  get    '/confirm',     to: 'menus#confirm'
  get    '/history',     to: 'menus#history'
  get    '/check',       to: 'menus#check'
  get    '/new',         to: 'menus#new'
  get    '/thanks',      to: 'menus#thanks'
  post   '/menus',       to: 'menus#create'
  delete '/menus',       to: 'menus#destroy'
  get    '/login',       to: 'sessions#new'
  post   '/login',       to: 'sessions#create'
  delete '/logout',      to: 'sessions#destroy'
  post   '/',            to: 'carts#add_item'
  post   '/confirm',     to: 'carts#update_item'
  delete '/delete_item', to: 'carts#delete_item'
  get    '/cart_items',  to: 'cart_items#show'
  resources :users
  resources :carts, only: [:show, :destroy]
end
