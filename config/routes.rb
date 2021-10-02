Rails.application.routes.draw do
  root   'menus#index'
  get    '/show/:id',         to: 'menus#show', as: 'show'
  get    '/confirm',          to: 'menus#confirm'
  get    '/history',          to: 'menus#history'
  get    '/check',            to: 'menus#check'
  get    '/thanks',           to: 'menus#thanks'
  post   '/call',             to: 'menus#call'
  get    '/new',              to: 'menus#new'
  post   '/menus',            to: 'menus#create'
  delete '/menus',            to: 'menus#destroy'
  patch  '/menus/:id',        to: 'menus#update', as: 'menu'
  get    '/:id/edit',         to: 'menus#edit', as: 'edit'
  post   '/:id/edit',         to: 'menus#sold_out', as: 'sold_out'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  get    '/logout',           to: 'sessions#delete'
  delete '/logout',           to: 'sessions#destroy'
  post   '/',                 to: 'carts#add_item'
  post   '/confirm',          to: 'carts#update_item'
  delete '/delete_item',      to: 'carts#delete_item'
  get    'orders/show',       to: 'orders#show', as: 'order'
  patch  'history_items/:id', to: 'orders#checked', as: 'checked'
  resources :users
  resources :carts, only: [:show, :destroy]
  resources :tables, only: [:show, :create, :new]
end
